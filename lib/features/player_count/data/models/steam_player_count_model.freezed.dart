// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steam_player_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SteamPlayerCountModel {
  @JsonKey(name: 'player_count')
  int get playerCount;
  @JsonKey(name: 'result')
  int get result;

  /// Create a copy of SteamPlayerCountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SteamPlayerCountModelCopyWith<SteamPlayerCountModel> get copyWith =>
      _$SteamPlayerCountModelCopyWithImpl<SteamPlayerCountModel>(
          this as SteamPlayerCountModel, _$identity);

  /// Serializes this SteamPlayerCountModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SteamPlayerCountModel &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerCount, result);

  @override
  String toString() {
    return 'SteamPlayerCountModel(playerCount: $playerCount, result: $result)';
  }
}

/// @nodoc
abstract mixin class $SteamPlayerCountModelCopyWith<$Res> {
  factory $SteamPlayerCountModelCopyWith(SteamPlayerCountModel value,
          $Res Function(SteamPlayerCountModel) _then) =
      _$SteamPlayerCountModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'player_count') int playerCount,
      @JsonKey(name: 'result') int result});
}

/// @nodoc
class _$SteamPlayerCountModelCopyWithImpl<$Res>
    implements $SteamPlayerCountModelCopyWith<$Res> {
  _$SteamPlayerCountModelCopyWithImpl(this._self, this._then);

  final SteamPlayerCountModel _self;
  final $Res Function(SteamPlayerCountModel) _then;

  /// Create a copy of SteamPlayerCountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerCount = null,
    Object? result = null,
  }) {
    return _then(_self.copyWith(
      playerCount: null == playerCount
          ? _self.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SteamPlayerCountModel].
extension SteamPlayerCountModelPatterns on SteamPlayerCountModel {
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
    TResult Function(_SteamPlayerCountModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamPlayerCountModel() when $default != null:
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
    TResult Function(_SteamPlayerCountModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamPlayerCountModel():
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
    TResult? Function(_SteamPlayerCountModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamPlayerCountModel() when $default != null:
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
    TResult Function(@JsonKey(name: 'player_count') int playerCount,
            @JsonKey(name: 'result') int result)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamPlayerCountModel() when $default != null:
        return $default(_that.playerCount, _that.result);
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
    TResult Function(@JsonKey(name: 'player_count') int playerCount,
            @JsonKey(name: 'result') int result)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamPlayerCountModel():
        return $default(_that.playerCount, _that.result);
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
    TResult? Function(@JsonKey(name: 'player_count') int playerCount,
            @JsonKey(name: 'result') int result)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamPlayerCountModel() when $default != null:
        return $default(_that.playerCount, _that.result);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SteamPlayerCountModel implements SteamPlayerCountModel {
  const _SteamPlayerCountModel(
      {@JsonKey(name: 'player_count') required this.playerCount,
      @JsonKey(name: 'result') required this.result});
  factory _SteamPlayerCountModel.fromJson(Map<String, dynamic> json) =>
      _$SteamPlayerCountModelFromJson(json);

  @override
  @JsonKey(name: 'player_count')
  final int playerCount;
  @override
  @JsonKey(name: 'result')
  final int result;

  /// Create a copy of SteamPlayerCountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SteamPlayerCountModelCopyWith<_SteamPlayerCountModel> get copyWith =>
      __$SteamPlayerCountModelCopyWithImpl<_SteamPlayerCountModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SteamPlayerCountModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SteamPlayerCountModel &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, playerCount, result);

  @override
  String toString() {
    return 'SteamPlayerCountModel(playerCount: $playerCount, result: $result)';
  }
}

/// @nodoc
abstract mixin class _$SteamPlayerCountModelCopyWith<$Res>
    implements $SteamPlayerCountModelCopyWith<$Res> {
  factory _$SteamPlayerCountModelCopyWith(_SteamPlayerCountModel value,
          $Res Function(_SteamPlayerCountModel) _then) =
      __$SteamPlayerCountModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'player_count') int playerCount,
      @JsonKey(name: 'result') int result});
}

/// @nodoc
class __$SteamPlayerCountModelCopyWithImpl<$Res>
    implements _$SteamPlayerCountModelCopyWith<$Res> {
  __$SteamPlayerCountModelCopyWithImpl(this._self, this._then);

  final _SteamPlayerCountModel _self;
  final $Res Function(_SteamPlayerCountModel) _then;

  /// Create a copy of SteamPlayerCountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? playerCount = null,
    Object? result = null,
  }) {
    return _then(_SteamPlayerCountModel(
      playerCount: null == playerCount
          ? _self.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
