import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/achievement_stat.dart';
import 'package:dartz/dartz.dart';

abstract class AchievementsRepository {
  Future<Either<Failure, List<AchievementStat>>> getRarestAchievements(int appId);
}
