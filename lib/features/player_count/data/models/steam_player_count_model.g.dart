// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_player_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SteamPlayerCountModel _$SteamPlayerCountModelFromJson(
        Map<String, dynamic> json) =>
    _SteamPlayerCountModel(
      playerCount: (json['player_count'] as num).toInt(),
      result: (json['result'] as num).toInt(),
    );

Map<String, dynamic> _$SteamPlayerCountModelToJson(
        _SteamPlayerCountModel instance) =>
    <String, dynamic>{
      'player_count': instance.playerCount,
      'result': instance.result,
    };
