import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_count_state.freezed.dart';

@freezed
sealed class PlayerCountState with _$PlayerCountState {
  /// Initial state before any data fetch
  const factory PlayerCountState.initial() = PlayerCountInitial;

  /// First load - show full-screen loading
  const factory PlayerCountState.loading() = PlayerCountLoading;

  /// Successfully loaded with data
  const factory PlayerCountState.loaded({
    required PlayerCount playerCount,
    required RegionalDistribution regionalDistribution,
    required DateTime lastUpdated,
    @Default(false) bool isRefreshing, // For pull-to-refresh overlay
    @Default(true) bool autoRefreshEnabled,
    Region? selectedRegion,
  }) = PlayerCountLoaded;

  /// Refreshing existing data (keeps old data visible)
  const factory PlayerCountState.refreshing({
    required PlayerCount previousCount,
    required RegionalDistribution previousDistribution,
    @Default(true) bool autoRefreshEnabled,
    Region? selectedRegion,
  }) = PlayerCountRefreshing;

  /// Error state with retry capability
  const factory PlayerCountState.error({
    required Failure failure,
    PlayerCount? lastKnownCount, // Show stale data if available
    @Default(0) int retryCount,
    @Default(true) bool autoRefreshEnabled,
    Region? selectedRegion,
  }) = PlayerCountError;
}
