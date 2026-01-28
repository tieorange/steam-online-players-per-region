import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_stat.freezed.dart';

@freezed
sealed class AchievementStat with _$AchievementStat {
  const factory AchievementStat({
    required String name,
    required double percent,
    required String displayName, // In case we want to pretty print or fetch schema later
  }) = _AchievementStat;
}
