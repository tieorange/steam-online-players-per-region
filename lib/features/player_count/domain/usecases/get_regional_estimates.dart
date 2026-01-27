import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/player_count_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRegionalEstimates {

  GetRegionalEstimates(this._repository);
  final PlayerCountRepository _repository;

  Either<Failure, RegionalDistribution> call(PlayerCount count) {
    return _repository.getRegionalEstimate(count);
  }
}
