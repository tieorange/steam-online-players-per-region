// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_count_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerCountState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlayerCountState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlayerCountState()';
  }
}

/// @nodoc
class $PlayerCountStateCopyWith<$Res> {
  $PlayerCountStateCopyWith(
      PlayerCountState _, $Res Function(PlayerCountState) __);
}

/// Adds pattern-matching-related methods to [PlayerCountState].
extension PlayerCountStatePatterns on PlayerCountState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlayerCountInitial value)? initial,
    TResult Function(PlayerCountLoading value)? loading,
    TResult Function(PlayerCountLoaded value)? loaded,
    TResult Function(PlayerCountRefreshing value)? refreshing,
    TResult Function(PlayerCountError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountInitial() when initial != null:
        return initial(_that);
      case PlayerCountLoading() when loading != null:
        return loading(_that);
      case PlayerCountLoaded() when loaded != null:
        return loaded(_that);
      case PlayerCountRefreshing() when refreshing != null:
        return refreshing(_that);
      case PlayerCountError() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlayerCountInitial value) initial,
    required TResult Function(PlayerCountLoading value) loading,
    required TResult Function(PlayerCountLoaded value) loaded,
    required TResult Function(PlayerCountRefreshing value) refreshing,
    required TResult Function(PlayerCountError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountInitial():
        return initial(_that);
      case PlayerCountLoading():
        return loading(_that);
      case PlayerCountLoaded():
        return loaded(_that);
      case PlayerCountRefreshing():
        return refreshing(_that);
      case PlayerCountError():
        return error(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlayerCountInitial value)? initial,
    TResult? Function(PlayerCountLoading value)? loading,
    TResult? Function(PlayerCountLoaded value)? loaded,
    TResult? Function(PlayerCountRefreshing value)? refreshing,
    TResult? Function(PlayerCountError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountInitial() when initial != null:
        return initial(_that);
      case PlayerCountLoading() when loading != null:
        return loading(_that);
      case PlayerCountLoaded() when loaded != null:
        return loaded(_that);
      case PlayerCountRefreshing() when refreshing != null:
        return refreshing(_that);
      case PlayerCountError() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            PlayerCount playerCount,
            RegionalDistribution regionalDistribution,
            DateTime lastUpdated,
            bool isRefreshing,
            bool autoRefreshEnabled,
            Region? selectedRegion)?
        loaded,
    TResult Function(
            PlayerCount previousCount,
            RegionalDistribution previousDistribution,
            bool autoRefreshEnabled,
            Region? selectedRegion)?
        refreshing,
    TResult Function(Failure failure, PlayerCount? lastKnownCount,
            int retryCount, bool autoRefreshEnabled, Region? selectedRegion)?
        error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountInitial() when initial != null:
        return initial();
      case PlayerCountLoading() when loading != null:
        return loading();
      case PlayerCountLoaded() when loaded != null:
        return loaded(
            _that.playerCount,
            _that.regionalDistribution,
            _that.lastUpdated,
            _that.isRefreshing,
            _that.autoRefreshEnabled,
            _that.selectedRegion);
      case PlayerCountRefreshing() when refreshing != null:
        return refreshing(_that.previousCount, _that.previousDistribution,
            _that.autoRefreshEnabled, _that.selectedRegion);
      case PlayerCountError() when error != null:
        return error(_that.failure, _that.lastKnownCount, _that.retryCount,
            _that.autoRefreshEnabled, _that.selectedRegion);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            PlayerCount playerCount,
            RegionalDistribution regionalDistribution,
            DateTime lastUpdated,
            bool isRefreshing,
            bool autoRefreshEnabled,
            Region? selectedRegion)
        loaded,
    required TResult Function(
            PlayerCount previousCount,
            RegionalDistribution previousDistribution,
            bool autoRefreshEnabled,
            Region? selectedRegion)
        refreshing,
    required TResult Function(Failure failure, PlayerCount? lastKnownCount,
            int retryCount, bool autoRefreshEnabled, Region? selectedRegion)
        error,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountInitial():
        return initial();
      case PlayerCountLoading():
        return loading();
      case PlayerCountLoaded():
        return loaded(
            _that.playerCount,
            _that.regionalDistribution,
            _that.lastUpdated,
            _that.isRefreshing,
            _that.autoRefreshEnabled,
            _that.selectedRegion);
      case PlayerCountRefreshing():
        return refreshing(_that.previousCount, _that.previousDistribution,
            _that.autoRefreshEnabled, _that.selectedRegion);
      case PlayerCountError():
        return error(_that.failure, _that.lastKnownCount, _that.retryCount,
            _that.autoRefreshEnabled, _that.selectedRegion);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            PlayerCount playerCount,
            RegionalDistribution regionalDistribution,
            DateTime lastUpdated,
            bool isRefreshing,
            bool autoRefreshEnabled,
            Region? selectedRegion)?
        loaded,
    TResult? Function(
            PlayerCount previousCount,
            RegionalDistribution previousDistribution,
            bool autoRefreshEnabled,
            Region? selectedRegion)?
        refreshing,
    TResult? Function(Failure failure, PlayerCount? lastKnownCount,
            int retryCount, bool autoRefreshEnabled, Region? selectedRegion)?
        error,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountInitial() when initial != null:
        return initial();
      case PlayerCountLoading() when loading != null:
        return loading();
      case PlayerCountLoaded() when loaded != null:
        return loaded(
            _that.playerCount,
            _that.regionalDistribution,
            _that.lastUpdated,
            _that.isRefreshing,
            _that.autoRefreshEnabled,
            _that.selectedRegion);
      case PlayerCountRefreshing() when refreshing != null:
        return refreshing(_that.previousCount, _that.previousDistribution,
            _that.autoRefreshEnabled, _that.selectedRegion);
      case PlayerCountError() when error != null:
        return error(_that.failure, _that.lastKnownCount, _that.retryCount,
            _that.autoRefreshEnabled, _that.selectedRegion);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PlayerCountInitial implements PlayerCountState {
  const PlayerCountInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlayerCountInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlayerCountState.initial()';
  }
}

/// @nodoc

class PlayerCountLoading implements PlayerCountState {
  const PlayerCountLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlayerCountLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlayerCountState.loading()';
  }
}

/// @nodoc

class PlayerCountLoaded implements PlayerCountState {
  const PlayerCountLoaded(
      {required this.playerCount,
      required this.regionalDistribution,
      required this.lastUpdated,
      this.isRefreshing = false,
      this.autoRefreshEnabled = true,
      this.selectedRegion});

  final PlayerCount playerCount;
  final RegionalDistribution regionalDistribution;
  final DateTime lastUpdated;
  @JsonKey()
  final bool isRefreshing;
// For pull-to-refresh overlay
  @JsonKey()
  final bool autoRefreshEnabled;
  final Region? selectedRegion;

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCountLoadedCopyWith<PlayerCountLoaded> get copyWith =>
      _$PlayerCountLoadedCopyWithImpl<PlayerCountLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountLoaded &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.regionalDistribution, regionalDistribution) ||
                other.regionalDistribution == regionalDistribution) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.autoRefreshEnabled, autoRefreshEnabled) ||
                other.autoRefreshEnabled == autoRefreshEnabled) &&
            (identical(other.selectedRegion, selectedRegion) ||
                other.selectedRegion == selectedRegion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      playerCount,
      regionalDistribution,
      lastUpdated,
      isRefreshing,
      autoRefreshEnabled,
      selectedRegion);

  @override
  String toString() {
    return 'PlayerCountState.loaded(playerCount: $playerCount, regionalDistribution: $regionalDistribution, lastUpdated: $lastUpdated, isRefreshing: $isRefreshing, autoRefreshEnabled: $autoRefreshEnabled, selectedRegion: $selectedRegion)';
  }
}

/// @nodoc
abstract mixin class $PlayerCountLoadedCopyWith<$Res>
    implements $PlayerCountStateCopyWith<$Res> {
  factory $PlayerCountLoadedCopyWith(
          PlayerCountLoaded value, $Res Function(PlayerCountLoaded) _then) =
      _$PlayerCountLoadedCopyWithImpl;
  @useResult
  $Res call(
      {PlayerCount playerCount,
      RegionalDistribution regionalDistribution,
      DateTime lastUpdated,
      bool isRefreshing,
      bool autoRefreshEnabled,
      Region? selectedRegion});

  $PlayerCountCopyWith<$Res> get playerCount;
  $RegionalDistributionCopyWith<$Res> get regionalDistribution;
}

/// @nodoc
class _$PlayerCountLoadedCopyWithImpl<$Res>
    implements $PlayerCountLoadedCopyWith<$Res> {
  _$PlayerCountLoadedCopyWithImpl(this._self, this._then);

  final PlayerCountLoaded _self;
  final $Res Function(PlayerCountLoaded) _then;

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playerCount = null,
    Object? regionalDistribution = null,
    Object? lastUpdated = null,
    Object? isRefreshing = null,
    Object? autoRefreshEnabled = null,
    Object? selectedRegion = freezed,
  }) {
    return _then(PlayerCountLoaded(
      playerCount: null == playerCount
          ? _self.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as PlayerCount,
      regionalDistribution: null == regionalDistribution
          ? _self.regionalDistribution
          : regionalDistribution // ignore: cast_nullable_to_non_nullable
              as RegionalDistribution,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRefreshing: null == isRefreshing
          ? _self.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      autoRefreshEnabled: null == autoRefreshEnabled
          ? _self.autoRefreshEnabled
          : autoRefreshEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRegion: freezed == selectedRegion
          ? _self.selectedRegion
          : selectedRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
    ));
  }

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerCountCopyWith<$Res> get playerCount {
    return $PlayerCountCopyWith<$Res>(_self.playerCount, (value) {
      return _then(_self.copyWith(playerCount: value));
    });
  }

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegionalDistributionCopyWith<$Res> get regionalDistribution {
    return $RegionalDistributionCopyWith<$Res>(_self.regionalDistribution,
        (value) {
      return _then(_self.copyWith(regionalDistribution: value));
    });
  }
}

/// @nodoc

class PlayerCountRefreshing implements PlayerCountState {
  const PlayerCountRefreshing(
      {required this.previousCount,
      required this.previousDistribution,
      this.autoRefreshEnabled = true,
      this.selectedRegion});

  final PlayerCount previousCount;
  final RegionalDistribution previousDistribution;
  @JsonKey()
  final bool autoRefreshEnabled;
  final Region? selectedRegion;

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCountRefreshingCopyWith<PlayerCountRefreshing> get copyWith =>
      _$PlayerCountRefreshingCopyWithImpl<PlayerCountRefreshing>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountRefreshing &&
            (identical(other.previousCount, previousCount) ||
                other.previousCount == previousCount) &&
            (identical(other.previousDistribution, previousDistribution) ||
                other.previousDistribution == previousDistribution) &&
            (identical(other.autoRefreshEnabled, autoRefreshEnabled) ||
                other.autoRefreshEnabled == autoRefreshEnabled) &&
            (identical(other.selectedRegion, selectedRegion) ||
                other.selectedRegion == selectedRegion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previousCount,
      previousDistribution, autoRefreshEnabled, selectedRegion);

  @override
  String toString() {
    return 'PlayerCountState.refreshing(previousCount: $previousCount, previousDistribution: $previousDistribution, autoRefreshEnabled: $autoRefreshEnabled, selectedRegion: $selectedRegion)';
  }
}

/// @nodoc
abstract mixin class $PlayerCountRefreshingCopyWith<$Res>
    implements $PlayerCountStateCopyWith<$Res> {
  factory $PlayerCountRefreshingCopyWith(PlayerCountRefreshing value,
          $Res Function(PlayerCountRefreshing) _then) =
      _$PlayerCountRefreshingCopyWithImpl;
  @useResult
  $Res call(
      {PlayerCount previousCount,
      RegionalDistribution previousDistribution,
      bool autoRefreshEnabled,
      Region? selectedRegion});

  $PlayerCountCopyWith<$Res> get previousCount;
  $RegionalDistributionCopyWith<$Res> get previousDistribution;
}

/// @nodoc
class _$PlayerCountRefreshingCopyWithImpl<$Res>
    implements $PlayerCountRefreshingCopyWith<$Res> {
  _$PlayerCountRefreshingCopyWithImpl(this._self, this._then);

  final PlayerCountRefreshing _self;
  final $Res Function(PlayerCountRefreshing) _then;

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? previousCount = null,
    Object? previousDistribution = null,
    Object? autoRefreshEnabled = null,
    Object? selectedRegion = freezed,
  }) {
    return _then(PlayerCountRefreshing(
      previousCount: null == previousCount
          ? _self.previousCount
          : previousCount // ignore: cast_nullable_to_non_nullable
              as PlayerCount,
      previousDistribution: null == previousDistribution
          ? _self.previousDistribution
          : previousDistribution // ignore: cast_nullable_to_non_nullable
              as RegionalDistribution,
      autoRefreshEnabled: null == autoRefreshEnabled
          ? _self.autoRefreshEnabled
          : autoRefreshEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRegion: freezed == selectedRegion
          ? _self.selectedRegion
          : selectedRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
    ));
  }

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerCountCopyWith<$Res> get previousCount {
    return $PlayerCountCopyWith<$Res>(_self.previousCount, (value) {
      return _then(_self.copyWith(previousCount: value));
    });
  }

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegionalDistributionCopyWith<$Res> get previousDistribution {
    return $RegionalDistributionCopyWith<$Res>(_self.previousDistribution,
        (value) {
      return _then(_self.copyWith(previousDistribution: value));
    });
  }
}

/// @nodoc

class PlayerCountError implements PlayerCountState {
  const PlayerCountError(
      {required this.failure,
      this.lastKnownCount,
      this.retryCount = 0,
      this.autoRefreshEnabled = true,
      this.selectedRegion});

  final Failure failure;
  final PlayerCount? lastKnownCount;
// Show stale data if available
  @JsonKey()
  final int retryCount;
  @JsonKey()
  final bool autoRefreshEnabled;
  final Region? selectedRegion;

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCountErrorCopyWith<PlayerCountError> get copyWith =>
      _$PlayerCountErrorCopyWithImpl<PlayerCountError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountError &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.lastKnownCount, lastKnownCount) ||
                other.lastKnownCount == lastKnownCount) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.autoRefreshEnabled, autoRefreshEnabled) ||
                other.autoRefreshEnabled == autoRefreshEnabled) &&
            (identical(other.selectedRegion, selectedRegion) ||
                other.selectedRegion == selectedRegion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, lastKnownCount,
      retryCount, autoRefreshEnabled, selectedRegion);

  @override
  String toString() {
    return 'PlayerCountState.error(failure: $failure, lastKnownCount: $lastKnownCount, retryCount: $retryCount, autoRefreshEnabled: $autoRefreshEnabled, selectedRegion: $selectedRegion)';
  }
}

/// @nodoc
abstract mixin class $PlayerCountErrorCopyWith<$Res>
    implements $PlayerCountStateCopyWith<$Res> {
  factory $PlayerCountErrorCopyWith(
          PlayerCountError value, $Res Function(PlayerCountError) _then) =
      _$PlayerCountErrorCopyWithImpl;
  @useResult
  $Res call(
      {Failure failure,
      PlayerCount? lastKnownCount,
      int retryCount,
      bool autoRefreshEnabled,
      Region? selectedRegion});

  $PlayerCountCopyWith<$Res>? get lastKnownCount;
}

/// @nodoc
class _$PlayerCountErrorCopyWithImpl<$Res>
    implements $PlayerCountErrorCopyWith<$Res> {
  _$PlayerCountErrorCopyWithImpl(this._self, this._then);

  final PlayerCountError _self;
  final $Res Function(PlayerCountError) _then;

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
    Object? lastKnownCount = freezed,
    Object? retryCount = null,
    Object? autoRefreshEnabled = null,
    Object? selectedRegion = freezed,
  }) {
    return _then(PlayerCountError(
      failure: null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      lastKnownCount: freezed == lastKnownCount
          ? _self.lastKnownCount
          : lastKnownCount // ignore: cast_nullable_to_non_nullable
              as PlayerCount?,
      retryCount: null == retryCount
          ? _self.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      autoRefreshEnabled: null == autoRefreshEnabled
          ? _self.autoRefreshEnabled
          : autoRefreshEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRegion: freezed == selectedRegion
          ? _self.selectedRegion
          : selectedRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
    ));
  }

  /// Create a copy of PlayerCountState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerCountCopyWith<$Res>? get lastKnownCount {
    if (_self.lastKnownCount == null) {
      return null;
    }

    return $PlayerCountCopyWith<$Res>(_self.lastKnownCount!, (value) {
      return _then(_self.copyWith(lastKnownCount: value));
    });
  }
}

// dart format on
