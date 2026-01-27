// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerCount {
  int get totalPlayers;
  int get steamPlayers;
  DateTime get timestamp;
  PlayerCountSource get source;

  /// Create a copy of PlayerCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerCountCopyWith<PlayerCount> get copyWith =>
      _$PlayerCountCopyWithImpl<PlayerCount>(this as PlayerCount, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerCount &&
            (identical(other.totalPlayers, totalPlayers) ||
                other.totalPlayers == totalPlayers) &&
            (identical(other.steamPlayers, steamPlayers) ||
                other.steamPlayers == steamPlayers) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalPlayers, steamPlayers, timestamp, source);

  @override
  String toString() {
    return 'PlayerCount(totalPlayers: $totalPlayers, steamPlayers: $steamPlayers, timestamp: $timestamp, source: $source)';
  }
}

/// @nodoc
abstract mixin class $PlayerCountCopyWith<$Res> {
  factory $PlayerCountCopyWith(
          PlayerCount value, $Res Function(PlayerCount) _then) =
      _$PlayerCountCopyWithImpl;
  @useResult
  $Res call(
      {int totalPlayers,
      int steamPlayers,
      DateTime timestamp,
      PlayerCountSource source});
}

/// @nodoc
class _$PlayerCountCopyWithImpl<$Res> implements $PlayerCountCopyWith<$Res> {
  _$PlayerCountCopyWithImpl(this._self, this._then);

  final PlayerCount _self;
  final $Res Function(PlayerCount) _then;

  /// Create a copy of PlayerCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPlayers = null,
    Object? steamPlayers = null,
    Object? timestamp = null,
    Object? source = null,
  }) {
    return _then(_self.copyWith(
      totalPlayers: null == totalPlayers
          ? _self.totalPlayers
          : totalPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      steamPlayers: null == steamPlayers
          ? _self.steamPlayers
          : steamPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as PlayerCountSource,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlayerCount].
extension PlayerCountPatterns on PlayerCount {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PlayerCount value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayerCount() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_PlayerCount value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerCount():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PlayerCount value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerCount() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int totalPlayers, int steamPlayers, DateTime timestamp,
            PlayerCountSource source)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayerCount() when $default != null:
        return $default(_that.totalPlayers, _that.steamPlayers, _that.timestamp,
            _that.source);
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
  TResult when<TResult extends Object?>(
    TResult Function(int totalPlayers, int steamPlayers, DateTime timestamp,
            PlayerCountSource source)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerCount():
        return $default(_that.totalPlayers, _that.steamPlayers, _that.timestamp,
            _that.source);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int totalPlayers, int steamPlayers, DateTime timestamp,
            PlayerCountSource source)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerCount() when $default != null:
        return $default(_that.totalPlayers, _that.steamPlayers, _that.timestamp,
            _that.source);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlayerCount implements PlayerCount {
  const _PlayerCount(
      {required this.totalPlayers,
      required this.steamPlayers,
      required this.timestamp,
      required this.source});

  @override
  final int totalPlayers;
  @override
  final int steamPlayers;
  @override
  final DateTime timestamp;
  @override
  final PlayerCountSource source;

  /// Create a copy of PlayerCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayerCountCopyWith<_PlayerCount> get copyWith =>
      __$PlayerCountCopyWithImpl<_PlayerCount>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerCount &&
            (identical(other.totalPlayers, totalPlayers) ||
                other.totalPlayers == totalPlayers) &&
            (identical(other.steamPlayers, steamPlayers) ||
                other.steamPlayers == steamPlayers) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalPlayers, steamPlayers, timestamp, source);

  @override
  String toString() {
    return 'PlayerCount(totalPlayers: $totalPlayers, steamPlayers: $steamPlayers, timestamp: $timestamp, source: $source)';
  }
}

/// @nodoc
abstract mixin class _$PlayerCountCopyWith<$Res>
    implements $PlayerCountCopyWith<$Res> {
  factory _$PlayerCountCopyWith(
          _PlayerCount value, $Res Function(_PlayerCount) _then) =
      __$PlayerCountCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalPlayers,
      int steamPlayers,
      DateTime timestamp,
      PlayerCountSource source});
}

/// @nodoc
class __$PlayerCountCopyWithImpl<$Res> implements _$PlayerCountCopyWith<$Res> {
  __$PlayerCountCopyWithImpl(this._self, this._then);

  final _PlayerCount _self;
  final $Res Function(_PlayerCount) _then;

  /// Create a copy of PlayerCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalPlayers = null,
    Object? steamPlayers = null,
    Object? timestamp = null,
    Object? source = null,
  }) {
    return _then(_PlayerCount(
      totalPlayers: null == totalPlayers
          ? _self.totalPlayers
          : totalPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      steamPlayers: null == steamPlayers
          ? _self.steamPlayers
          : steamPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as PlayerCountSource,
    ));
  }
}

// dart format on
