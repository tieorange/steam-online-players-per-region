// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_recommendation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerRecommendation {
  Region get recommendedRegion;
  Playstyle get playstyle;
  String get reason;
  int get estimatedPlayers;
  double get score;

  /// Create a copy of ServerRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServerRecommendationCopyWith<ServerRecommendation> get copyWith =>
      _$ServerRecommendationCopyWithImpl<ServerRecommendation>(
          this as ServerRecommendation, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerRecommendation &&
            (identical(other.recommendedRegion, recommendedRegion) ||
                other.recommendedRegion == recommendedRegion) &&
            (identical(other.playstyle, playstyle) ||
                other.playstyle == playstyle) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.estimatedPlayers, estimatedPlayers) ||
                other.estimatedPlayers == estimatedPlayers) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recommendedRegion, playstyle,
      reason, estimatedPlayers, score);

  @override
  String toString() {
    return 'ServerRecommendation(recommendedRegion: $recommendedRegion, playstyle: $playstyle, reason: $reason, estimatedPlayers: $estimatedPlayers, score: $score)';
  }
}

/// @nodoc
abstract mixin class $ServerRecommendationCopyWith<$Res> {
  factory $ServerRecommendationCopyWith(ServerRecommendation value,
          $Res Function(ServerRecommendation) _then) =
      _$ServerRecommendationCopyWithImpl;
  @useResult
  $Res call(
      {Region recommendedRegion,
      Playstyle playstyle,
      String reason,
      int estimatedPlayers,
      double score});
}

/// @nodoc
class _$ServerRecommendationCopyWithImpl<$Res>
    implements $ServerRecommendationCopyWith<$Res> {
  _$ServerRecommendationCopyWithImpl(this._self, this._then);

  final ServerRecommendation _self;
  final $Res Function(ServerRecommendation) _then;

  /// Create a copy of ServerRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedRegion = null,
    Object? playstyle = null,
    Object? reason = null,
    Object? estimatedPlayers = null,
    Object? score = null,
  }) {
    return _then(_self.copyWith(
      recommendedRegion: null == recommendedRegion
          ? _self.recommendedRegion
          : recommendedRegion // ignore: cast_nullable_to_non_nullable
              as Region,
      playstyle: null == playstyle
          ? _self.playstyle
          : playstyle // ignore: cast_nullable_to_non_nullable
              as Playstyle,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedPlayers: null == estimatedPlayers
          ? _self.estimatedPlayers
          : estimatedPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServerRecommendation].
extension ServerRecommendationPatterns on ServerRecommendation {
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
    TResult Function(_ServerRecommendation value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServerRecommendation() when $default != null:
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
    TResult Function(_ServerRecommendation value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerRecommendation():
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
    TResult? Function(_ServerRecommendation value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerRecommendation() when $default != null:
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
    TResult Function(Region recommendedRegion, Playstyle playstyle,
            String reason, int estimatedPlayers, double score)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServerRecommendation() when $default != null:
        return $default(_that.recommendedRegion, _that.playstyle, _that.reason,
            _that.estimatedPlayers, _that.score);
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
    TResult Function(Region recommendedRegion, Playstyle playstyle,
            String reason, int estimatedPlayers, double score)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerRecommendation():
        return $default(_that.recommendedRegion, _that.playstyle, _that.reason,
            _that.estimatedPlayers, _that.score);
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
    TResult? Function(Region recommendedRegion, Playstyle playstyle,
            String reason, int estimatedPlayers, double score)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServerRecommendation() when $default != null:
        return $default(_that.recommendedRegion, _that.playstyle, _that.reason,
            _that.estimatedPlayers, _that.score);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ServerRecommendation implements ServerRecommendation {
  const _ServerRecommendation(
      {required this.recommendedRegion,
      required this.playstyle,
      required this.reason,
      required this.estimatedPlayers,
      required this.score});

  @override
  final Region recommendedRegion;
  @override
  final Playstyle playstyle;
  @override
  final String reason;
  @override
  final int estimatedPlayers;
  @override
  final double score;

  /// Create a copy of ServerRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServerRecommendationCopyWith<_ServerRecommendation> get copyWith =>
      __$ServerRecommendationCopyWithImpl<_ServerRecommendation>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServerRecommendation &&
            (identical(other.recommendedRegion, recommendedRegion) ||
                other.recommendedRegion == recommendedRegion) &&
            (identical(other.playstyle, playstyle) ||
                other.playstyle == playstyle) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.estimatedPlayers, estimatedPlayers) ||
                other.estimatedPlayers == estimatedPlayers) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recommendedRegion, playstyle,
      reason, estimatedPlayers, score);

  @override
  String toString() {
    return 'ServerRecommendation(recommendedRegion: $recommendedRegion, playstyle: $playstyle, reason: $reason, estimatedPlayers: $estimatedPlayers, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$ServerRecommendationCopyWith<$Res>
    implements $ServerRecommendationCopyWith<$Res> {
  factory _$ServerRecommendationCopyWith(_ServerRecommendation value,
          $Res Function(_ServerRecommendation) _then) =
      __$ServerRecommendationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Region recommendedRegion,
      Playstyle playstyle,
      String reason,
      int estimatedPlayers,
      double score});
}

/// @nodoc
class __$ServerRecommendationCopyWithImpl<$Res>
    implements _$ServerRecommendationCopyWith<$Res> {
  __$ServerRecommendationCopyWithImpl(this._self, this._then);

  final _ServerRecommendation _self;
  final $Res Function(_ServerRecommendation) _then;

  /// Create a copy of ServerRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? recommendedRegion = null,
    Object? playstyle = null,
    Object? reason = null,
    Object? estimatedPlayers = null,
    Object? score = null,
  }) {
    return _then(_ServerRecommendation(
      recommendedRegion: null == recommendedRegion
          ? _self.recommendedRegion
          : recommendedRegion // ignore: cast_nullable_to_non_nullable
              as Region,
      playstyle: null == playstyle
          ? _self.playstyle
          : playstyle // ignore: cast_nullable_to_non_nullable
              as Playstyle,
      reason: null == reason
          ? _self.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedPlayers: null == estimatedPlayers
          ? _self.estimatedPlayers
          : estimatedPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
