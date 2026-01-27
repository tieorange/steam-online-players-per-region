import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/region_estimator.dart';
import '../../domain/entities/player_count.dart';
import '../../domain/entities/regional_distribution.dart';
import '../../domain/repositories/player_count_repository.dart';
import '../datasources/player_count_local_datasource.dart';
import '../datasources/steam_remote_datasource.dart';
import '../models/steam_player_count_model.dart';

@LazySingleton(as: PlayerCountRepository)
class PlayerCountRepositoryImpl implements PlayerCountRepository {
  final SteamRemoteDataSource _remoteDataSource;
  final PlayerCountLocalDataSource _localDataSource;
  final RegionEstimator _regionEstimator;

  PlayerCountRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._regionEstimator,
  );

  @override
  Future<Either<Failure, PlayerCount>> getCurrentPlayerCount() async {
    try {
      final model = await _remoteDataSource.getCurrentPlayerCount();
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
  Stream<Either<Failure, PlayerCount>> streamPlayerCount(Duration interval) async* {
    // Emit immediate value
    yield await getCurrentPlayerCount();

    // Then periodic
    await for (final _ in Stream.periodic(interval)) {
      yield await getCurrentPlayerCount();
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
