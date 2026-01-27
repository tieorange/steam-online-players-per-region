// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_count_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerCountEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlayerCountEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlayerCountEvent()';
  }
}

/// @nodoc
class $PlayerCountEventCopyWith<$Res> {
  $PlayerCountEventCopyWith(
      PlayerCountEvent _, $Res Function(PlayerCountEvent) __);
}

/// Adds pattern-matching-related methods to [PlayerCountEvent].
extension PlayerCountEventPatterns on PlayerCountEvent {
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
    TResult Function(PlayerCountStarted value)? started,
    TResult Function(PlayerCountRefreshRequested value)? refreshRequested,
    TResult Function(PlayerCountRetryRequested value)? retryRequested,
    TResult Function(PlayerCountRegionSelected value)? regionSelected,
    TResult Function(PlayerCountAutoRefreshToggled value)? autoRefreshToggled,
    TResult Function(PlayerCountUpdated value)? playerCountUpdated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountStarted() when started != null:
        return started(_that);
      case PlayerCountRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
      case PlayerCountRetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case PlayerCountRegionSelected() when regionSelected != null:
        return regionSelected(_that);
      case PlayerCountAutoRefreshToggled() when autoRefreshToggled != null:
        return autoRefreshToggled(_that);
      case PlayerCountUpdated() when playerCountUpdated != null:
        return playerCountUpdated(_that);
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
    required TResult Function(PlayerCountStarted value) started,
    required TResult Function(PlayerCountRefreshRequested value)
        refreshRequested,
    required TResult Function(PlayerCountRetryRequested value) retryRequested,
    required TResult Function(PlayerCountRegionSelected value) regionSelected,
    required TResult Function(PlayerCountAutoRefreshToggled value)
        autoRefreshToggled,
    required TResult Function(PlayerCountUpdated value) playerCountUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountStarted():
        return started(_that);
      case PlayerCountRefreshRequested():
        return refreshRequested(_that);
      case PlayerCountRetryRequested():
        return retryRequested(_that);
      case PlayerCountRegionSelected():
        return regionSelected(_that);
      case PlayerCountAutoRefreshToggled():
        return autoRefreshToggled(_that);
      case PlayerCountUpdated():
        return playerCountUpdated(_that);
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
    TResult? Function(PlayerCountStarted value)? started,
    TResult? Function(PlayerCountRefreshRequested value)? refreshRequested,
    TResult? Function(PlayerCountRetryRequested value)? retryRequested,
    TResult? Function(PlayerCountRegionSelected value)? regionSelected,
    TResult? Function(PlayerCountAutoRefreshToggled value)? autoRefreshToggled,
    TResult? Function(PlayerCountUpdated value)? playerCountUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountStarted() when started != null:
        return started(_that);
      case PlayerCountRefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
      case PlayerCountRetryRequested() when retryRequested != null:
        return retryRequested(_that);
      case PlayerCountRegionSelected() when regionSelected != null:
        return regionSelected(_that);
      case PlayerCountAutoRefreshToggled() when autoRefreshToggled != null:
        return autoRefreshToggled(_that);
      case PlayerCountUpdated() when playerCountUpdated != null:
        return playerCountUpdated(_that);
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
    TResult Function()? started,
    TResult Function()? refreshRequested,
    TResult Function()? retryRequested,
    TResult Function(Region region)? regionSelected,
    TResult Function(bool enabled)? autoRefreshToggled,
    TResult Function(Either<Failure, PlayerCount> result)? playerCountUpdated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountStarted() when started != null:
        return started();
      case PlayerCountRefreshRequested() when refreshRequested != null:
        return refreshRequested();
      case PlayerCountRetryRequested() when retryRequested != null:
        return retryRequested();
      case PlayerCountRegionSelected() when regionSelected != null:
        return regionSelected(_that.region);
      case PlayerCountAutoRefreshToggled() when autoRefreshToggled != null:
        return autoRefreshToggled(_that.enabled);
      case PlayerCountUpdated() when playerCountUpdated != null:
        return playerCountUpdated(_that.result);
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
    required TResult Function() started,
    required TResult Function() refreshRequested,
    required TResult Function() retryRequested,
    required TResult Function(Region region) regionSelected,
    required TResult Function(bool enabled) autoRefreshToggled,
    required TResult Function(Either<Failure, PlayerCount> result)
        playerCountUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountStarted():
        return started();
      case PlayerCountRefreshRequested():
        return refreshRequested();
      case PlayerCountRetryRequested():
        return retryRequested();
      case PlayerCountRegionSelected():
        return regionSelected(_that.region);
      case PlayerCountAutoRefreshToggled():
        return autoRefreshToggled(_that.enabled);
      case PlayerCountUpdated():
        return playerCountUpdated(_that.result);
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
    TResult? Function()? started,
    TResult? Function()? refreshRequested,
    TResult? Function()? retryRequested,
    TResult? Function(Region region)? regionSelected,
    TResult? Function(bool enabled)? autoRefreshToggled,
    TResult? Function(Either<Failure, PlayerCount> result)? playerCountUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case PlayerCountStarted() when started != null:
        return started();
      case PlayerCountRefreshRequested() when refreshRequested != null:
        return refreshRequested();
      case PlayerCountRetryRequested() when retryRequested != null:
        return retryRequested();
      case PlayerCountRegionSelected() when regionSelected != null:
        return regionSelected(_that.region);
      case PlayerCountAutoRefreshToggled() when autoRefreshToggled != null:
        return autoRefreshToggled(_that.enabled);
      case PlayerCountUpdated() when playerCountUpdated != null:
        return playerCountUpdated(_that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PlayerCountStarted implements PlayerCountEvent {
  const PlayerCountStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PlayerCountStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlayerCountEvent.started()';
  }
}

/// @nodoc

class PlayerCountRefreshRequested implements PlayerCountEvent {
  const PlayerCountRefreshRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountRefreshRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlayerCountEvent.refreshRequested()';
  }
}

/// @nodoc

class PlayerCountRetryRequested implements PlayerCountEvent {
  const PlayerCountRetryRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountRetryRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PlayerCountEvent.retryRequested()';
  }
}

/// @nodoc

class PlayerCountRegionSelected implements PlayerCountEvent {
  const PlayerCountRegionSelected(this.region);

  final Region region;

  /// Create a copy of PlayerCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCountRegionSelectedCopyWith<PlayerCountRegionSelected> get copyWith =>
      _$PlayerCountRegionSelectedCopyWithImpl<PlayerCountRegionSelected>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountRegionSelected &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, region);

  @override
  String toString() {
    return 'PlayerCountEvent.regionSelected(region: $region)';
  }
}

/// @nodoc
abstract mixin class $PlayerCountRegionSelectedCopyWith<$Res>
    implements $PlayerCountEventCopyWith<$Res> {
  factory $PlayerCountRegionSelectedCopyWith(PlayerCountRegionSelected value,
          $Res Function(PlayerCountRegionSelected) _then) =
      _$PlayerCountRegionSelectedCopyWithImpl;
  @useResult
  $Res call({Region region});
}

/// @nodoc
class _$PlayerCountRegionSelectedCopyWithImpl<$Res>
    implements $PlayerCountRegionSelectedCopyWith<$Res> {
  _$PlayerCountRegionSelectedCopyWithImpl(this._self, this._then);

  final PlayerCountRegionSelected _self;
  final $Res Function(PlayerCountRegionSelected) _then;

  /// Create a copy of PlayerCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? region = null,
  }) {
    return _then(PlayerCountRegionSelected(
      null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as Region,
    ));
  }
}

/// @nodoc

class PlayerCountAutoRefreshToggled implements PlayerCountEvent {
  const PlayerCountAutoRefreshToggled({required this.enabled});

  final bool enabled;

  /// Create a copy of PlayerCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCountAutoRefreshToggledCopyWith<PlayerCountAutoRefreshToggled>
      get copyWith => _$PlayerCountAutoRefreshToggledCopyWithImpl<
          PlayerCountAutoRefreshToggled>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountAutoRefreshToggled &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled);

  @override
  String toString() {
    return 'PlayerCountEvent.autoRefreshToggled(enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $PlayerCountAutoRefreshToggledCopyWith<$Res>
    implements $PlayerCountEventCopyWith<$Res> {
  factory $PlayerCountAutoRefreshToggledCopyWith(
          PlayerCountAutoRefreshToggled value,
          $Res Function(PlayerCountAutoRefreshToggled) _then) =
      _$PlayerCountAutoRefreshToggledCopyWithImpl;
  @useResult
  $Res call({bool enabled});
}

/// @nodoc
class _$PlayerCountAutoRefreshToggledCopyWithImpl<$Res>
    implements $PlayerCountAutoRefreshToggledCopyWith<$Res> {
  _$PlayerCountAutoRefreshToggledCopyWithImpl(this._self, this._then);

  final PlayerCountAutoRefreshToggled _self;
  final $Res Function(PlayerCountAutoRefreshToggled) _then;

  /// Create a copy of PlayerCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
  }) {
    return _then(PlayerCountAutoRefreshToggled(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class PlayerCountUpdated implements PlayerCountEvent {
  const PlayerCountUpdated(this.result);

  final Either<Failure, PlayerCount> result;

  /// Create a copy of PlayerCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCountUpdatedCopyWith<PlayerCountUpdated> get copyWith =>
      _$PlayerCountUpdatedCopyWithImpl<PlayerCountUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCountUpdated &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @override
  String toString() {
    return 'PlayerCountEvent.playerCountUpdated(result: $result)';
  }
}

/// @nodoc
abstract mixin class $PlayerCountUpdatedCopyWith<$Res>
    implements $PlayerCountEventCopyWith<$Res> {
  factory $PlayerCountUpdatedCopyWith(
          PlayerCountUpdated value, $Res Function(PlayerCountUpdated) _then) =
      _$PlayerCountUpdatedCopyWithImpl;
  @useResult
  $Res call({Either<Failure, PlayerCount> result});
}

/// @nodoc
class _$PlayerCountUpdatedCopyWithImpl<$Res>
    implements $PlayerCountUpdatedCopyWith<$Res> {
  _$PlayerCountUpdatedCopyWithImpl(this._self, this._then);

  final PlayerCountUpdated _self;
  final $Res Function(PlayerCountUpdated) _then;

  /// Create a copy of PlayerCountEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? result = null,
  }) {
    return _then(PlayerCountUpdated(
      null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as Either<Failure, PlayerCount>,
    ));
  }
}

// dart format on
