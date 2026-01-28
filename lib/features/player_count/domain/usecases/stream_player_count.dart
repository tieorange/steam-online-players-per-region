import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/player_count_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StreamPlayerCount {
  StreamPlayerCount(this._repository);
  final PlayerCountRepository _repository;

  Stream<Either<Failure, PlayerCount>> call({required int appId, required Duration interval}) {
    return _repository.streamPlayerCount(appId, interval);
  }
}
