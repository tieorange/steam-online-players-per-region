import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:dartz/dartz.dart';

abstract class PlayerCountRepository {
  /// Fetches current player count from Steam (or cache fallback)
  Future<Either<Failure, PlayerCount>> getCurrentPlayerCount(int appId);

  /// Streams player count updates every [interval]
  Stream<Either<Failure, PlayerCount>> streamPlayerCount(int appId, Duration interval);

  /// Gets estimated regional distribution
  Either<Failure, RegionalDistribution> getRegionalEstimate(PlayerCount count);
}
