// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SteamAchievementModel _$SteamAchievementModelFromJson(
        Map<String, dynamic> json) =>
    _SteamAchievementModel(
      achievementpercentages: AchievementPercentages.fromJson(
          json['achievementpercentages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SteamAchievementModelToJson(
        _SteamAchievementModel instance) =>
    <String, dynamic>{
      'achievementpercentages': instance.achievementpercentages,
    };

_AchievementPercentages _$AchievementPercentagesFromJson(
        Map<String, dynamic> json) =>
    _AchievementPercentages(
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) =>
              AchievementPercentageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AchievementPercentagesToJson(
        _AchievementPercentages instance) =>
    <String, dynamic>{
      'achievements': instance.achievements,
    };

_AchievementPercentageItem _$AchievementPercentageItemFromJson(
        Map<String, dynamic> json) =>
    _AchievementPercentageItem(
      name: json['name'] as String,
      percent: _stringToDouble(json['percent']),
    );

Map<String, dynamic> _$AchievementPercentageItemToJson(
        _AchievementPercentageItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'percent': instance.percent,
    };
