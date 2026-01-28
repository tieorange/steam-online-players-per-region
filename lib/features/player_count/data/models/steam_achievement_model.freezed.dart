// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steam_achievement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SteamAchievementModel {
  AchievementPercentages get achievementpercentages;

  /// Create a copy of SteamAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SteamAchievementModelCopyWith<SteamAchievementModel> get copyWith =>
      _$SteamAchievementModelCopyWithImpl<SteamAchievementModel>(
          this as SteamAchievementModel, _$identity);

  /// Serializes this SteamAchievementModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SteamAchievementModel &&
            (identical(other.achievementpercentages, achievementpercentages) ||
                other.achievementpercentages == achievementpercentages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, achievementpercentages);

  @override
  String toString() {
    return 'SteamAchievementModel(achievementpercentages: $achievementpercentages)';
  }
}

/// @nodoc
abstract mixin class $SteamAchievementModelCopyWith<$Res> {
  factory $SteamAchievementModelCopyWith(SteamAchievementModel value,
          $Res Function(SteamAchievementModel) _then) =
      _$SteamAchievementModelCopyWithImpl;
  @useResult
  $Res call({AchievementPercentages achievementpercentages});

  $AchievementPercentagesCopyWith<$Res> get achievementpercentages;
}

/// @nodoc
class _$SteamAchievementModelCopyWithImpl<$Res>
    implements $SteamAchievementModelCopyWith<$Res> {
  _$SteamAchievementModelCopyWithImpl(this._self, this._then);

  final SteamAchievementModel _self;
  final $Res Function(SteamAchievementModel) _then;

  /// Create a copy of SteamAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievementpercentages = null,
  }) {
    return _then(_self.copyWith(
      achievementpercentages: null == achievementpercentages
          ? _self.achievementpercentages
          : achievementpercentages // ignore: cast_nullable_to_non_nullable
              as AchievementPercentages,
    ));
  }

  /// Create a copy of SteamAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AchievementPercentagesCopyWith<$Res> get achievementpercentages {
    return $AchievementPercentagesCopyWith<$Res>(_self.achievementpercentages,
        (value) {
      return _then(_self.copyWith(achievementpercentages: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SteamAchievementModel].
extension SteamAchievementModelPatterns on SteamAchievementModel {
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
    TResult Function(_SteamAchievementModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamAchievementModel() when $default != null:
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
    TResult Function(_SteamAchievementModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamAchievementModel():
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
    TResult? Function(_SteamAchievementModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamAchievementModel() when $default != null:
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
    TResult Function(AchievementPercentages achievementpercentages)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamAchievementModel() when $default != null:
        return $default(_that.achievementpercentages);
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
    TResult Function(AchievementPercentages achievementpercentages) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamAchievementModel():
        return $default(_that.achievementpercentages);
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
    TResult? Function(AchievementPercentages achievementpercentages)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamAchievementModel() when $default != null:
        return $default(_that.achievementpercentages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SteamAchievementModel implements SteamAchievementModel {
  const _SteamAchievementModel({required this.achievementpercentages});
  factory _SteamAchievementModel.fromJson(Map<String, dynamic> json) =>
      _$SteamAchievementModelFromJson(json);

  @override
  final AchievementPercentages achievementpercentages;

  /// Create a copy of SteamAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SteamAchievementModelCopyWith<_SteamAchievementModel> get copyWith =>
      __$SteamAchievementModelCopyWithImpl<_SteamAchievementModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SteamAchievementModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SteamAchievementModel &&
            (identical(other.achievementpercentages, achievementpercentages) ||
                other.achievementpercentages == achievementpercentages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, achievementpercentages);

  @override
  String toString() {
    return 'SteamAchievementModel(achievementpercentages: $achievementpercentages)';
  }
}

/// @nodoc
abstract mixin class _$SteamAchievementModelCopyWith<$Res>
    implements $SteamAchievementModelCopyWith<$Res> {
  factory _$SteamAchievementModelCopyWith(_SteamAchievementModel value,
          $Res Function(_SteamAchievementModel) _then) =
      __$SteamAchievementModelCopyWithImpl;
  @override
  @useResult
  $Res call({AchievementPercentages achievementpercentages});

  @override
  $AchievementPercentagesCopyWith<$Res> get achievementpercentages;
}

/// @nodoc
class __$SteamAchievementModelCopyWithImpl<$Res>
    implements _$SteamAchievementModelCopyWith<$Res> {
  __$SteamAchievementModelCopyWithImpl(this._self, this._then);

  final _SteamAchievementModel _self;
  final $Res Function(_SteamAchievementModel) _then;

  /// Create a copy of SteamAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? achievementpercentages = null,
  }) {
    return _then(_SteamAchievementModel(
      achievementpercentages: null == achievementpercentages
          ? _self.achievementpercentages
          : achievementpercentages // ignore: cast_nullable_to_non_nullable
              as AchievementPercentages,
    ));
  }

  /// Create a copy of SteamAchievementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AchievementPercentagesCopyWith<$Res> get achievementpercentages {
    return $AchievementPercentagesCopyWith<$Res>(_self.achievementpercentages,
        (value) {
      return _then(_self.copyWith(achievementpercentages: value));
    });
  }
}

/// @nodoc
mixin _$AchievementPercentages {
  List<AchievementPercentageItem> get achievements;

  /// Create a copy of AchievementPercentages
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AchievementPercentagesCopyWith<AchievementPercentages> get copyWith =>
      _$AchievementPercentagesCopyWithImpl<AchievementPercentages>(
          this as AchievementPercentages, _$identity);

  /// Serializes this AchievementPercentages to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AchievementPercentages &&
            const DeepCollectionEquality()
                .equals(other.achievements, achievements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(achievements));

  @override
  String toString() {
    return 'AchievementPercentages(achievements: $achievements)';
  }
}

/// @nodoc
abstract mixin class $AchievementPercentagesCopyWith<$Res> {
  factory $AchievementPercentagesCopyWith(AchievementPercentages value,
          $Res Function(AchievementPercentages) _then) =
      _$AchievementPercentagesCopyWithImpl;
  @useResult
  $Res call({List<AchievementPercentageItem> achievements});
}

/// @nodoc
class _$AchievementPercentagesCopyWithImpl<$Res>
    implements $AchievementPercentagesCopyWith<$Res> {
  _$AchievementPercentagesCopyWithImpl(this._self, this._then);

  final AchievementPercentages _self;
  final $Res Function(AchievementPercentages) _then;

  /// Create a copy of AchievementPercentages
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? achievements = null,
  }) {
    return _then(_self.copyWith(
      achievements: null == achievements
          ? _self.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementPercentageItem>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AchievementPercentages].
extension AchievementPercentagesPatterns on AchievementPercentages {
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
    TResult Function(_AchievementPercentages value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentages() when $default != null:
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
    TResult Function(_AchievementPercentages value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentages():
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
    TResult? Function(_AchievementPercentages value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentages() when $default != null:
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
    TResult Function(List<AchievementPercentageItem> achievements)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentages() when $default != null:
        return $default(_that.achievements);
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
    TResult Function(List<AchievementPercentageItem> achievements) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentages():
        return $default(_that.achievements);
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
    TResult? Function(List<AchievementPercentageItem> achievements)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentages() when $default != null:
        return $default(_that.achievements);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AchievementPercentages implements AchievementPercentages {
  const _AchievementPercentages(
      {required final List<AchievementPercentageItem> achievements})
      : _achievements = achievements;
  factory _AchievementPercentages.fromJson(Map<String, dynamic> json) =>
      _$AchievementPercentagesFromJson(json);

  final List<AchievementPercentageItem> _achievements;
  @override
  List<AchievementPercentageItem> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  /// Create a copy of AchievementPercentages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AchievementPercentagesCopyWith<_AchievementPercentages> get copyWith =>
      __$AchievementPercentagesCopyWithImpl<_AchievementPercentages>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AchievementPercentagesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AchievementPercentages &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_achievements));

  @override
  String toString() {
    return 'AchievementPercentages(achievements: $achievements)';
  }
}

/// @nodoc
abstract mixin class _$AchievementPercentagesCopyWith<$Res>
    implements $AchievementPercentagesCopyWith<$Res> {
  factory _$AchievementPercentagesCopyWith(_AchievementPercentages value,
          $Res Function(_AchievementPercentages) _then) =
      __$AchievementPercentagesCopyWithImpl;
  @override
  @useResult
  $Res call({List<AchievementPercentageItem> achievements});
}

/// @nodoc
class __$AchievementPercentagesCopyWithImpl<$Res>
    implements _$AchievementPercentagesCopyWith<$Res> {
  __$AchievementPercentagesCopyWithImpl(this._self, this._then);

  final _AchievementPercentages _self;
  final $Res Function(_AchievementPercentages) _then;

  /// Create a copy of AchievementPercentages
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? achievements = null,
  }) {
    return _then(_AchievementPercentages(
      achievements: null == achievements
          ? _self._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<AchievementPercentageItem>,
    ));
  }
}

/// @nodoc
mixin _$AchievementPercentageItem {
  String get name;
  @JsonKey(fromJson: _stringToDouble)
  double get percent;

  /// Create a copy of AchievementPercentageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AchievementPercentageItemCopyWith<AchievementPercentageItem> get copyWith =>
      _$AchievementPercentageItemCopyWithImpl<AchievementPercentageItem>(
          this as AchievementPercentageItem, _$identity);

  /// Serializes this AchievementPercentageItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AchievementPercentageItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, percent);

  @override
  String toString() {
    return 'AchievementPercentageItem(name: $name, percent: $percent)';
  }
}

/// @nodoc
abstract mixin class $AchievementPercentageItemCopyWith<$Res> {
  factory $AchievementPercentageItemCopyWith(AchievementPercentageItem value,
          $Res Function(AchievementPercentageItem) _then) =
      _$AchievementPercentageItemCopyWithImpl;
  @useResult
  $Res call({String name, @JsonKey(fromJson: _stringToDouble) double percent});
}

/// @nodoc
class _$AchievementPercentageItemCopyWithImpl<$Res>
    implements $AchievementPercentageItemCopyWith<$Res> {
  _$AchievementPercentageItemCopyWithImpl(this._self, this._then);

  final AchievementPercentageItem _self;
  final $Res Function(AchievementPercentageItem) _then;

  /// Create a copy of AchievementPercentageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? percent = null,
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
    ));
  }
}

/// Adds pattern-matching-related methods to [AchievementPercentageItem].
extension AchievementPercentageItemPatterns on AchievementPercentageItem {
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
    TResult Function(_AchievementPercentageItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentageItem() when $default != null:
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
    TResult Function(_AchievementPercentageItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentageItem():
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
    TResult? Function(_AchievementPercentageItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentageItem() when $default != null:
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
    TResult Function(
            String name, @JsonKey(fromJson: _stringToDouble) double percent)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentageItem() when $default != null:
        return $default(_that.name, _that.percent);
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
    TResult Function(
            String name, @JsonKey(fromJson: _stringToDouble) double percent)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentageItem():
        return $default(_that.name, _that.percent);
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
    TResult? Function(
            String name, @JsonKey(fromJson: _stringToDouble) double percent)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AchievementPercentageItem() when $default != null:
        return $default(_that.name, _that.percent);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AchievementPercentageItem implements AchievementPercentageItem {
  const _AchievementPercentageItem(
      {required this.name,
      @JsonKey(fromJson: _stringToDouble) required this.percent});
  factory _AchievementPercentageItem.fromJson(Map<String, dynamic> json) =>
      _$AchievementPercentageItemFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(fromJson: _stringToDouble)
  final double percent;

  /// Create a copy of AchievementPercentageItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AchievementPercentageItemCopyWith<_AchievementPercentageItem>
      get copyWith =>
          __$AchievementPercentageItemCopyWithImpl<_AchievementPercentageItem>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AchievementPercentageItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AchievementPercentageItem &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, percent);

  @override
  String toString() {
    return 'AchievementPercentageItem(name: $name, percent: $percent)';
  }
}

/// @nodoc
abstract mixin class _$AchievementPercentageItemCopyWith<$Res>
    implements $AchievementPercentageItemCopyWith<$Res> {
  factory _$AchievementPercentageItemCopyWith(_AchievementPercentageItem value,
          $Res Function(_AchievementPercentageItem) _then) =
      __$AchievementPercentageItemCopyWithImpl;
  @override
  @useResult
  $Res call({String name, @JsonKey(fromJson: _stringToDouble) double percent});
}

/// @nodoc
class __$AchievementPercentageItemCopyWithImpl<$Res>
    implements _$AchievementPercentageItemCopyWith<$Res> {
  __$AchievementPercentageItemCopyWithImpl(this._self, this._then);

  final _AchievementPercentageItem _self;
  final $Res Function(_AchievementPercentageItem) _then;

  /// Create a copy of AchievementPercentageItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? percent = null,
  }) {
    return _then(_AchievementPercentageItem(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
