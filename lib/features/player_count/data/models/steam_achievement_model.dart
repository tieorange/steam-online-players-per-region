import 'package:freezed_annotation/freezed_annotation.dart';

part 'steam_achievement_model.freezed.dart';
part 'steam_achievement_model.g.dart';

@freezed
sealed class SteamAchievementModel with _$SteamAchievementModel {
  const factory SteamAchievementModel({
    required AchievementPercentages achievementpercentages,
  }) = _SteamAchievementModel;

  factory SteamAchievementModel.fromJson(Map<String, dynamic> json) =>
      _$SteamAchievementModelFromJson(json);
}

double _stringToDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}

@freezed
sealed class AchievementPercentages with _$AchievementPercentages {
  const factory AchievementPercentages({
    required List<AchievementPercentageItem> achievements,
  }) = _AchievementPercentages;

  factory AchievementPercentages.fromJson(Map<String, dynamic> json) =>
      _$AchievementPercentagesFromJson(json);
}

@freezed
sealed class AchievementPercentageItem with _$AchievementPercentageItem {
  const factory AchievementPercentageItem({
    required String name,
    @JsonKey(fromJson: _stringToDouble) required double percent,
  }) = _AchievementPercentageItem;

  factory AchievementPercentageItem.fromJson(Map<String, dynamic> json) =>
      _$AchievementPercentageItemFromJson(json);
}
