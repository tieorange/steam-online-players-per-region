import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/core/usecases/usecase.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/player_count_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCurrentPlayerCount implements UseCase<PlayerCount, int> {
  GetCurrentPlayerCount(this._repository);
  final PlayerCountRepository _repository;

  @override
  Future<Either<Failure, PlayerCount>> call(int appId) {
    return _repository.getCurrentPlayerCount(appId);
  }
}
