// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regional_distribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegionalDistribution {
  Map<Region, int> get distribution;
  DateTime get calculatedAt;
  bool get isEstimate;

  /// Create a copy of RegionalDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegionalDistributionCopyWith<RegionalDistribution> get copyWith =>
      _$RegionalDistributionCopyWithImpl<RegionalDistribution>(
          this as RegionalDistribution, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegionalDistribution &&
            const DeepCollectionEquality()
                .equals(other.distribution, distribution) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.isEstimate, isEstimate) ||
                other.isEstimate == isEstimate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(distribution),
      calculatedAt,
      isEstimate);

  @override
  String toString() {
    return 'RegionalDistribution(distribution: $distribution, calculatedAt: $calculatedAt, isEstimate: $isEstimate)';
  }
}

/// @nodoc
abstract mixin class $RegionalDistributionCopyWith<$Res> {
  factory $RegionalDistributionCopyWith(RegionalDistribution value,
          $Res Function(RegionalDistribution) _then) =
      _$RegionalDistributionCopyWithImpl;
  @useResult
  $Res call(
      {Map<Region, int> distribution, DateTime calculatedAt, bool isEstimate});
}

/// @nodoc
class _$RegionalDistributionCopyWithImpl<$Res>
    implements $RegionalDistributionCopyWith<$Res> {
  _$RegionalDistributionCopyWithImpl(this._self, this._then);

  final RegionalDistribution _self;
  final $Res Function(RegionalDistribution) _then;

  /// Create a copy of RegionalDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distribution = null,
    Object? calculatedAt = null,
    Object? isEstimate = null,
  }) {
    return _then(_self.copyWith(
      distribution: null == distribution
          ? _self.distribution
          : distribution // ignore: cast_nullable_to_non_nullable
              as Map<Region, int>,
      calculatedAt: null == calculatedAt
          ? _self.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEstimate: null == isEstimate
          ? _self.isEstimate
          : isEstimate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [RegionalDistribution].
extension RegionalDistributionPatterns on RegionalDistribution {
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
    TResult Function(_RegionalDistribution value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegionalDistribution() when $default != null:
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
    TResult Function(_RegionalDistribution value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegionalDistribution():
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
    TResult? Function(_RegionalDistribution value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegionalDistribution() when $default != null:
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
    TResult Function(Map<Region, int> distribution, DateTime calculatedAt,
            bool isEstimate)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RegionalDistribution() when $default != null:
        return $default(
            _that.distribution, _that.calculatedAt, _that.isEstimate);
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
    TResult Function(Map<Region, int> distribution, DateTime calculatedAt,
            bool isEstimate)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegionalDistribution():
        return $default(
            _that.distribution, _that.calculatedAt, _that.isEstimate);
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
    TResult? Function(Map<Region, int> distribution, DateTime calculatedAt,
            bool isEstimate)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RegionalDistribution() when $default != null:
        return $default(
            _that.distribution, _that.calculatedAt, _that.isEstimate);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RegionalDistribution implements RegionalDistribution {
  const _RegionalDistribution(
      {required final Map<Region, int> distribution,
      required this.calculatedAt,
      required this.isEstimate})
      : _distribution = distribution;

  final Map<Region, int> _distribution;
  @override
  Map<Region, int> get distribution {
    if (_distribution is EqualUnmodifiableMapView) return _distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_distribution);
  }

  @override
  final DateTime calculatedAt;
  @override
  final bool isEstimate;

  /// Create a copy of RegionalDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegionalDistributionCopyWith<_RegionalDistribution> get copyWith =>
      __$RegionalDistributionCopyWithImpl<_RegionalDistribution>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegionalDistribution &&
            const DeepCollectionEquality()
                .equals(other._distribution, _distribution) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt) &&
            (identical(other.isEstimate, isEstimate) ||
                other.isEstimate == isEstimate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_distribution),
      calculatedAt,
      isEstimate);

  @override
  String toString() {
    return 'RegionalDistribution(distribution: $distribution, calculatedAt: $calculatedAt, isEstimate: $isEstimate)';
  }
}

/// @nodoc
abstract mixin class _$RegionalDistributionCopyWith<$Res>
    implements $RegionalDistributionCopyWith<$Res> {
  factory _$RegionalDistributionCopyWith(_RegionalDistribution value,
          $Res Function(_RegionalDistribution) _then) =
      __$RegionalDistributionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<Region, int> distribution, DateTime calculatedAt, bool isEstimate});
}

/// @nodoc
class __$RegionalDistributionCopyWithImpl<$Res>
    implements _$RegionalDistributionCopyWith<$Res> {
  __$RegionalDistributionCopyWithImpl(this._self, this._then);

  final _RegionalDistribution _self;
  final $Res Function(_RegionalDistribution) _then;

  /// Create a copy of RegionalDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? distribution = null,
    Object? calculatedAt = null,
    Object? isEstimate = null,
  }) {
    return _then(_RegionalDistribution(
      distribution: null == distribution
          ? _self._distribution
          : distribution // ignore: cast_nullable_to_non_nullable
              as Map<Region, int>,
      calculatedAt: null == calculatedAt
          ? _self.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isEstimate: null == isEstimate
          ? _self.isEstimate
          : isEstimate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
