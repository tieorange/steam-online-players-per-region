import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/achievement_stat.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/achievements_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGlobalAchievements {
  GetGlobalAchievements(this._repository);

  final AchievementsRepository _repository;

  Future<Either<Failure, List<AchievementStat>>> call(int appId) async {
    return _repository.getRarestAchievements(appId);
  }
}
