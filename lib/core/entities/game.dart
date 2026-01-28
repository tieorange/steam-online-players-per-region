import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';

/// Represents a Steam game that can be tracked
@freezed
sealed class Game with _$Game {
  const factory Game({
    required int appId,
    required String name,
    required String shortName,
  }) = _Game;
}
