import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/player_count.dart';
import '../repositories/player_count_repository.dart';

@lazySingleton
class StreamPlayerCount {
  final PlayerCountRepository _repository;

  StreamPlayerCount(this._repository);

  Stream<Either<Failure, PlayerCount>> call(Duration interval) {
    return _repository.streamPlayerCount(interval);
  }
}
