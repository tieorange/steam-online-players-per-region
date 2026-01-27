import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/player_count.dart';
import '../repositories/player_count_repository.dart';

@lazySingleton
class GetCurrentPlayerCount implements UseCase<PlayerCount, NoParams> {
  final PlayerCountRepository _repository;

  GetCurrentPlayerCount(this._repository);

  @override
  Future<Either<Failure, PlayerCount>> call(NoParams params) {
    return _repository.getCurrentPlayerCount();
  }
}
