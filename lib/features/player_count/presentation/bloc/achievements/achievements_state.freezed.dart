// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievements_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AchievementsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AchievementsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AchievementsState()';
  }
}

/// @nodoc
class $AchievementsStateCopyWith<$Res> {
  $AchievementsStateCopyWith(
      AchievementsState _, $Res Function(AchievementsState) __);
}

/// Adds pattern-matching-related methods to [AchievementsState].
extension AchievementsStatePatterns on AchievementsState {
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
    TResult Function(AchievementsInitial value)? initial,
    TResult Function(AchievementsLoading value)? loading,
    TResult Function(AchievementsLoaded value)? loaded,
    TResult Function(AchievementsError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AchievementsInitial() when initial != null:
        return initial(_that);
      case AchievementsLoading() when loading != null:
        return loading(_that);
      case AchievementsLoaded() when loaded != null:
        return loaded(_that);
      case AchievementsError() when error != null:
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
    required TResult Function(AchievementsInitial value) initial,
    required TResult Function(AchievementsLoading value) loading,
    required TResult Function(AchievementsLoaded value) loaded,
    required TResult Function(AchievementsError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case AchievementsInitial():
        return initial(_that);
      case AchievementsLoading():
        return loading(_that);
      case AchievementsLoaded():
        return loaded(_that);
      case AchievementsError():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(AchievementsInitial value)? initial,
    TResult? Function(AchievementsLoading value)? loading,
    TResult? Function(AchievementsLoaded value)? loaded,
    TResult? Function(AchievementsError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case AchievementsInitial() when initial != null:
        return initial(_that);
      case AchievementsLoading() when loading != null:
        return loading(_that);
      case AchievementsLoaded() when loaded != null:
        return loaded(_that);
      case AchievementsError() when error != null:
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
    TResult Function(List<AchievementStat> achievements)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AchievementsInitial() when initial != null:
        return initial();
      case AchievementsLoading() when loading != null:
        return loading();
      case AchievementsLoaded() when loaded != null:
        return loaded(_that.achievements);
      case AchievementsError() when error != null:
        return error(_that.failure);
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
    required TResult Function(List<AchievementStat> achievements) loaded,
    required TResult Function(Failure failure) error,
  }) {
    final _that = this;
    switch (_that) {
      case AchievementsInitial():
        return initial();
      case AchievementsLoading():
        return loading();
      case AchievementsLoaded():
        return loaded(_that.achievements);
      case AchievementsError():
        return error(_that.failure);
      case _:
        throw StateError('Unexpected subclass');
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
    TResult? Function(List<AchievementStat> achievements)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    final _that = this;
    switch (_that) {
      case AchievementsInitial() when initial != null:
        return initial();
      case AchievementsLoading() when loading != null:
        return loading();
      case AchievementsLoaded() when loaded != null:
        return loaded(_that.achievements);
      case AchievementsError() when error != null:
        return error(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class AchievementsInitial implements AchievementsState {
  const AchievementsInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AchievementsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AchievementsState.initial()';
  }
}

/// @nodoc

class AchievementsLoading implements AchievementsState {
  const AchievementsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AchievementsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AchievementsState.loading()';
  }
}

/// @nodoc

class AchievementsLoaded implements AchievementsState {
  const AchievementsLoaded(final List<AchievementStat> achievements)
      : _achievements = achievements;

  final List<AchievementStat> _achievements;
  List<AchievementStat> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AchievementsLoadedCopyWith<AchievementsLoaded> get copyWith =>
      _$AchievementsLoadedCopyWithImpl<AchievementsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AchievementsLoaded &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_achievements));

  @override
  String toString() {
    return 'AchievementsState.loaded(achievements: $achievements)';
  }
}

/// @nodoc
abstract mixin class $AchievementsLoadedCopyWith<$Res>
    implements $AchievementsStateCopyWith<$Res> {
  factory $AchievementsLoadedCopyWith(
          AchievementsLoaded value, $Res Function(AchievementsLoaded) _then) =
      _$AchievementsLoadedCopyWithImpl;
  @useResult
  $Res call({List<AchievementStat> achievements});
}

/// @nodoc
class _$AchievementsLoadedCopyWithImpl<$Res>
    implements $AchievementsLoadedCopyWith<$Res> {
  _$AchievementsLoadedCopyWithImpl(this._self, this._then);

  final AchievementsLoaded _self;
  final $Res Function(AchievementsLoaded) _then;

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? achievements = null,
  }) {
    return _then(AchievementsLoaded(
      null == achievements
          ? _self._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementStat>,
    ));
  }
}

/// @nodoc

class AchievementsError implements AchievementsState {
  const AchievementsError(this.failure);

  final Failure failure;

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AchievementsErrorCopyWith<AchievementsError> get copyWith =>
      _$AchievementsErrorCopyWithImpl<AchievementsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AchievementsError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'AchievementsState.error(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $AchievementsErrorCopyWith<$Res>
    implements $AchievementsStateCopyWith<$Res> {
  factory $AchievementsErrorCopyWith(
          AchievementsError value, $Res Function(AchievementsError) _then) =
      _$AchievementsErrorCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$AchievementsErrorCopyWithImpl<$Res>
    implements $AchievementsErrorCopyWith<$Res> {
  _$AchievementsErrorCopyWithImpl(this._self, this._then);

  final AchievementsError _self;
  final $Res Function(AchievementsError) _then;

  /// Create a copy of AchievementsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(AchievementsError(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
