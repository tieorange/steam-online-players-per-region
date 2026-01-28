import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/achievement_stat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievements_state.freezed.dart';

@freezed
class AchievementsState with _$AchievementsState {
  const factory AchievementsState.initial() = AchievementsInitial;
  const factory AchievementsState.loading() = AchievementsLoading;
  const factory AchievementsState.loaded(List<AchievementStat> achievements) = AchievementsLoaded;
  const factory AchievementsState.error(Failure failure) = AchievementsError;
}
