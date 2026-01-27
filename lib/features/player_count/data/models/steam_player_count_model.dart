// ignore_for_file: invalid_annotation_target
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'steam_player_count_model.freezed.dart';
part 'steam_player_count_model.g.dart';

@freezed
sealed class SteamPlayerCountModel with _$SteamPlayerCountModel {
  const factory SteamPlayerCountModel({
    @JsonKey(name: 'player_count') required int playerCount,
    @JsonKey(name: 'result') required int result,
  }) = _SteamPlayerCountModel;

  factory SteamPlayerCountModel.fromJson(Map<String, dynamic> json) =>
      _$SteamPlayerCountModelFromJson(json);

  // Helper helper to handle the nested "response" object from Steam API
  factory SteamPlayerCountModel.fromResponse(Map<String, dynamic> json) {
    if (json.containsKey('response')) {
      return SteamPlayerCountModel.fromJson(json['response'] as Map<String, dynamic>);
    }
    return SteamPlayerCountModel.fromJson(json);
  }
}

extension SteamPlayerCountModelX on SteamPlayerCountModel {
  PlayerCount toEntity() => PlayerCount(
        totalPlayers: playerCount,
        steamPlayers: playerCount,
        timestamp: DateTime.now().toUtc(),
        source: PlayerCountSource.steam,
      );
}
