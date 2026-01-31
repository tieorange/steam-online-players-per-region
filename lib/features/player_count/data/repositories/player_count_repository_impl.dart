import 'dart:async';

import 'package:arc_raiders_tracker/core/error/exceptions.dart';
import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/core/utils/region_estimator.dart';
import 'package:arc_raiders_tracker/features/player_count/data/datasources/player_count_local_datasource.dart';
import 'package:arc_raiders_tracker/features/player_count/data/datasources/steam_remote_datasource.dart';
import 'package:arc_raiders_tracker/features/player_count/data/models/steam_player_count_model.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/player_count_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:arc_raiders_tracker/core/utils/retry_policy.dart';

@LazySingleton(as: PlayerCountRepository)
class PlayerCountRepositoryImpl implements PlayerCountRepository {
  PlayerCountRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._regionEstimator,
  );
  final SteamRemoteDataSource _remoteDataSource;
  final PlayerCountLocalDataSource _localDataSource;
  final RegionEstimator _regionEstimator;
  final RetryPolicy _retryPolicy = const RetryPolicy();

  @override
  Future<Either<Failure, PlayerCount>> getCurrentPlayerCount(int appId) async {
    try {
      final model =
          await _retryPolicy.execute(() => _remoteDataSource.getCurrentPlayerCount(appId));
      final entity = model.toEntity();
      await _localDataSource.cachePlayerCount(entity);
      return Right(entity);
    } on ServerException catch (e) {
      return _fallbackToCache(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return _fallbackToCache(NetworkFailure(message: e.message));
    } on TimeoutException {
      return _fallbackToCache(TimeoutFailure());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, PlayerCount>> _fallbackToCache(Failure originalFailure) async {
    try {
      final cached = await _localDataSource.getLastPlayerCount();
      if (cached != null) {
        return Right(cached.copyWith(source: PlayerCountSource.cached));
      }
      return Left(originalFailure);
    } catch (_) {
      return Left(originalFailure);
    }
  }

  @override
  Stream<Either<Failure, PlayerCount>> streamPlayerCount(int appId, Duration interval) async* {
    // Emit immediate value
    yield await getCurrentPlayerCount(appId);

    // Then periodic
    await for (final _ in Stream<dynamic>.periodic(interval)) {
      yield await getCurrentPlayerCount(appId);
    }
  }

  @override
  Either<Failure, RegionalDistribution> getRegionalEstimate(PlayerCount count) {
    try {
      final distribution = _regionEstimator.estimateRegionalDistribution(
        count.totalPlayers,
        DateTime.now().toUtc(),
      );
      return Right(
        RegionalDistribution(
          distribution: distribution,
          calculatedAt: DateTime.now().toUtc(),
          isEstimate: true,
        ),
      );
    } catch (e) {
      return Left(EstimationFailure(message: e.toString()));
    }
  }
}
