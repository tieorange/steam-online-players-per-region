import 'package:arc_raiders_tracker/features/player_count/domain/entities/playstyle.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_recommendation.freezed.dart';

@freezed
sealed class ServerRecommendation with _$ServerRecommendation {
  const factory ServerRecommendation({
    required Region recommendedRegion,
    required Playstyle playstyle,
    required String reason,
    required int estimatedPlayers,
    required double score, // 0.0 - 1.0 confidence
  }) = _ServerRecommendation;
}
