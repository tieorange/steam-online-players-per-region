import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/player_count.dart';
import '../entities/regional_distribution.dart';

abstract class PlayerCountRepository {
  /// Fetches current player count from Steam (or cache fallback)
  Future<Either<Failure, PlayerCount>> getCurrentPlayerCount();

  /// Streams player count updates every [interval]
  Stream<Either<Failure, PlayerCount>> streamPlayerCount(Duration interval);

  /// Gets estimated regional distribution
  Either<Failure, RegionalDistribution> getRegionalEstimate(PlayerCount count);
}
