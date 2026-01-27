import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_count.freezed.dart';

enum PlayerCountSource { steam, cached, estimated }

@freezed
sealed class PlayerCount with _$PlayerCount {
  const factory PlayerCount({
    required int totalPlayers,
    required int steamPlayers,
    required DateTime timestamp,
    required PlayerCountSource source,
  }) = _PlayerCount;
}
