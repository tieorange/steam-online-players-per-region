import 'dart:async';

import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/core/usecases/usecase.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/usecases/get_current_player_count.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/usecases/get_regional_estimates.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_event.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlayerCountBloc extends Bloc<PlayerCountEvent, PlayerCountState> {
  PlayerCountBloc(
    this._getCurrentPlayerCount,
    this._getRegionalEstimates,
  ) : super(const PlayerCountState.initial()) {
    on<PlayerCountStarted>(_onStarted);
    on<PlayerCountRefreshRequested>(_onRefreshRequested);
    on<PlayerCountRetryRequested>(_onRetryRequested);
    on<PlayerCountRegionSelected>(_onRegionSelected);
    on<PlayerCountAutoRefreshToggled>(_onAutoRefreshToggled);
    on<PlayerCountUpdated>(_onPlayerCountUpdated);
  }
  final GetCurrentPlayerCount _getCurrentPlayerCount;
  final GetRegionalEstimates _getRegionalEstimates;

  StreamSubscription<dynamic>? _subscription;
  Timer? _refreshTimer;

  Future<void> _onStarted(PlayerCountStarted event, Emitter<PlayerCountState> emit) async {
    emit(const PlayerCountState.loading());
    _startPolling(emit);
  }

  void _startPolling(Emitter<PlayerCountState> emit) {
    _subscription?.cancel();
    _refreshTimer?.cancel();

    // Initial fetch
    add(const PlayerCountEvent.refreshRequested());

    // Auto refresh every 60 seconds
    _refreshTimer = Timer.periodic(const Duration(seconds: 60), (_) {
      final isAutoRefresh = state.maybeWhen(
        loaded: (a, b, c, d, autoEnabled, e) => autoEnabled,
        refreshing: (a, b, autoEnabled, c) => autoEnabled,
        error: (a, b, c, autoEnabled, d) => autoEnabled,
        orElse: () => true,
      );

      if (isAutoRefresh) {
        add(const PlayerCountEvent.refreshRequested());
      }
    });

    // We can also use the stream use case, but explicit timer gives more control over "refreshing" state UI
    // For now sticking to manual timer + refresh request to easier handle states
  }

  Future<void> _onRefreshRequested(
    PlayerCountRefreshRequested event,
    Emitter<PlayerCountState> emit,
  ) async {
    final currentState = state;

    // Optimistic UI updates to show refreshing state
    if (currentState is PlayerCountLoaded) {
      emit(currentState.copyWith(isRefreshing: true));
    } else if (currentState is PlayerCountLoaded) {
      // Redundant check but for safety
      // Already handled
    } else if (currentState is! PlayerCountLoading && currentState is! PlayerCountInitial) {
      // If in error state with data, switch to refreshing
      if (currentState is PlayerCountError && currentState.lastKnownCount != null) {
        // Keep error state until success? Or show refreshing?
        // Showing refreshing is better if we have old data
      }
    }

    final result = await _getCurrentPlayerCount(const NoParams());
    add(PlayerCountEvent.playerCountUpdated(result));
  }

  Future<void> _onRetryRequested(
    PlayerCountRetryRequested event,
    Emitter<PlayerCountState> emit,
  ) async {
    emit(const PlayerCountState.loading());
    add(const PlayerCountEvent.refreshRequested());
  }

  void _onPlayerCountUpdated(PlayerCountUpdated event, Emitter<PlayerCountState> emit) {
    event.result.fold(
      (failure) => _handleFailure(failure, emit),
      (playerCount) => _handleSuccess(playerCount, emit),
    );
  }

  void _handleSuccess(PlayerCount playerCount, Emitter<PlayerCountState> emit) {
    final regionalResult = _getRegionalEstimates(playerCount);

    // Get current preferences
    final currentRegion = state.maybeWhen(
      loaded: (a, b, c, d, e, region) => region,
      refreshing: (a, b, c, region) => region,
      error: (a, b, c, d, region) => region,
      orElse: () => null,
    );

    final currentAutoRefresh = state.maybeWhen(
      loaded: (a, b, c, d, auto, e) => auto,
      refreshing: (a, b, auto, c) => auto,
      error: (a, b, c, auto, d) => auto,
      orElse: () => true,
    );

    regionalResult.fold(
      (failure) => emit(
        PlayerCountState.loaded(
          playerCount: playerCount,
          regionalDistribution: RegionalDistribution.empty(),
          lastUpdated: DateTime.now(),
          selectedRegion: currentRegion,
          autoRefreshEnabled: currentAutoRefresh,
        ),
      ),
      (distribution) => emit(
        PlayerCountState.loaded(
          playerCount: playerCount,
          regionalDistribution: distribution,
          lastUpdated: DateTime.now(),
          selectedRegion: currentRegion,
          autoRefreshEnabled: currentAutoRefresh,
        ),
      ),
    );
  }

  void _handleFailure(Failure failure, Emitter<PlayerCountState> emit) {
    final currentState = state;
    final lastKnown = switch (currentState) {
      PlayerCountLoaded(:final playerCount) => playerCount,
      PlayerCountRefreshing(:final previousCount) => previousCount,
      PlayerCountError(:final lastKnownCount) => lastKnownCount,
      _ => null,
    };

    final currentRegion = state.maybeWhen(
      loaded: (_, __, ___, ____, _____, region) => region,
      refreshing: (_, __, ___, region) => region,
      error: (_, __, ___, ____, region) => region,
      orElse: () => null,
    );

    final currentAutoRefresh = state.maybeWhen(
      loaded: (a, b, c, d, auto, e) => auto,
      refreshing: (a, b, auto, c) => auto,
      error: (a, b, c, auto, d) => auto,
      orElse: () => true,
    );

    emit(
      PlayerCountState.error(
        failure: failure,
        lastKnownCount: lastKnown,
        retryCount: currentState is PlayerCountError ? currentState.retryCount + 1 : 0,
        selectedRegion: currentRegion,
        autoRefreshEnabled: currentAutoRefresh,
      ),
    );
  }

  void _onRegionSelected(PlayerCountRegionSelected event, Emitter<PlayerCountState> emit) {
    state.mapOrNull(
      loaded: (s) =>
          emit(s.copyWith(selectedRegion: s.selectedRegion == event.region ? null : event.region)),
      refreshing: (s) =>
          emit(s.copyWith(selectedRegion: s.selectedRegion == event.region ? null : event.region)),
      error: (s) =>
          emit(s.copyWith(selectedRegion: s.selectedRegion == event.region ? null : event.region)),
    );
  }

  void _onAutoRefreshToggled(PlayerCountAutoRefreshToggled event, Emitter<PlayerCountState> emit) {
    state.mapOrNull(
      loaded: (s) => emit(s.copyWith(autoRefreshEnabled: event.enabled)),
      refreshing: (s) => emit(s.copyWith(autoRefreshEnabled: event.enabled)),
      error: (s) => emit(s.copyWith(autoRefreshEnabled: event.enabled)),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _refreshTimer?.cancel();
    return super.close();
  }
}
