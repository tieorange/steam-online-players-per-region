import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/player_count.dart';
import '../entities/regional_distribution.dart';
import '../repositories/player_count_repository.dart';

@lazySingleton
class GetRegionalEstimates {
  final PlayerCountRepository _repository;

  GetRegionalEstimates(this._repository);

  Either<Failure, RegionalDistribution> call(PlayerCount count) {
    return _repository.getRegionalEstimate(count);
  }
}
