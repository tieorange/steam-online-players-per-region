// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AchievementStat {
  String get name;
  double get percent;
  String get displayName;

  /// Create a copy of AchievementStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AchievementStatCopyWith<AchievementStat> get copyWith =>
      _$AchievementStatCopyWithImpl<AchievementStat>(
          this as AchievementStat, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AchievementStat &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, percent, displayName);

  @override
  String toString() {
    return 'AchievementStat(name: $name, percent: $percent, displayName: $displayName)';
  }
}

/// @nodoc
abstract mixin class $AchievementStatCopyWith<$Res> {
  factory $AchievementStatCopyWith(
          AchievementStat value, $Res Function(AchievementStat) _then) =
      _$AchievementStatCopyWithImpl;
  @useResult
  $Res call({String name, double percent, String displayName});
}

/// @nodoc
class _$AchievementStatCopyWithImpl<$Res>
    implements $AchievementStatCopyWith<$Res> {
  _$AchievementStatCopyWithImpl(this._self, this._then);

  final AchievementStat _self;
  final $Res Function(AchievementStat) _then;

  /// Create a copy of AchievementStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? percent = null,
    Object? displayName = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AchievementStat].
extension AchievementStatPatterns on AchievementStat {
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
    TResult Function(_AchievementStat value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AchievementStat() when $default != null:
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
    TResult Function(_AchievementStat value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementStat():
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
    TResult? Function(_AchievementStat value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementStat() when $default != null:
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
    TResult Function(String name, double percent, String displayName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AchievementStat() when $default != null:
        return $default(_that.name, _that.percent, _that.displayName);
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
    TResult Function(String name, double percent, String displayName) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementStat():
        return $default(_that.name, _that.percent, _that.displayName);
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
    TResult? Function(String name, double percent, String displayName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementStat() when $default != null:
        return $default(_that.name, _that.percent, _that.displayName);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AchievementStat implements AchievementStat {
  const _AchievementStat(
      {required this.name, required this.percent, required this.displayName});

  @override
  final String name;
  @override
  final double percent;
  @override
  final String displayName;

  /// Create a copy of AchievementStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AchievementStatCopyWith<_AchievementStat> get copyWith =>
      __$AchievementStatCopyWithImpl<_AchievementStat>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AchievementStat &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, percent, displayName);

  @override
  String toString() {
    return 'AchievementStat(name: $name, percent: $percent, displayName: $displayName)';
  }
}

/// @nodoc
abstract mixin class _$AchievementStatCopyWith<$Res>
    implements $AchievementStatCopyWith<$Res> {
  factory _$AchievementStatCopyWith(
          _AchievementStat value, $Res Function(_AchievementStat) _then) =
      __$AchievementStatCopyWithImpl;
  @override
  @useResult
  $Res call({String name, double percent, String displayName});
}

/// @nodoc
class __$AchievementStatCopyWithImpl<$Res>
    implements _$AchievementStatCopyWith<$Res> {
  __$AchievementStatCopyWithImpl(this._self, this._then);

  final _AchievementStat _self;
  final $Res Function(_AchievementStat) _then;

  /// Create a copy of AchievementStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? percent = null,
    Object? displayName = null,
  }) {
    return _then(_AchievementStat(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
