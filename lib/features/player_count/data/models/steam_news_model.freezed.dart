// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'steam_news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SteamNewsModel {
  AppNews get appnews;

  /// Create a copy of SteamNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SteamNewsModelCopyWith<SteamNewsModel> get copyWith =>
      _$SteamNewsModelCopyWithImpl<SteamNewsModel>(
          this as SteamNewsModel, _$identity);

  /// Serializes this SteamNewsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SteamNewsModel &&
            (identical(other.appnews, appnews) || other.appnews == appnews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appnews);

  @override
  String toString() {
    return 'SteamNewsModel(appnews: $appnews)';
  }
}

/// @nodoc
abstract mixin class $SteamNewsModelCopyWith<$Res> {
  factory $SteamNewsModelCopyWith(
          SteamNewsModel value, $Res Function(SteamNewsModel) _then) =
      _$SteamNewsModelCopyWithImpl;
  @useResult
  $Res call({AppNews appnews});

  $AppNewsCopyWith<$Res> get appnews;
}

/// @nodoc
class _$SteamNewsModelCopyWithImpl<$Res>
    implements $SteamNewsModelCopyWith<$Res> {
  _$SteamNewsModelCopyWithImpl(this._self, this._then);

  final SteamNewsModel _self;
  final $Res Function(SteamNewsModel) _then;

  /// Create a copy of SteamNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appnews = null,
  }) {
    return _then(_self.copyWith(
      appnews: null == appnews
          ? _self.appnews
          : appnews // ignore: cast_nullable_to_non_nullable
              as AppNews,
    ));
  }

  /// Create a copy of SteamNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppNewsCopyWith<$Res> get appnews {
    return $AppNewsCopyWith<$Res>(_self.appnews, (value) {
      return _then(_self.copyWith(appnews: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SteamNewsModel].
extension SteamNewsModelPatterns on SteamNewsModel {
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
    TResult Function(_SteamNewsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamNewsModel() when $default != null:
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
    TResult Function(_SteamNewsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsModel():
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
    TResult? Function(_SteamNewsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsModel() when $default != null:
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
    TResult Function(AppNews appnews)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamNewsModel() when $default != null:
        return $default(_that.appnews);
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
    TResult Function(AppNews appnews) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsModel():
        return $default(_that.appnews);
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
    TResult? Function(AppNews appnews)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsModel() when $default != null:
        return $default(_that.appnews);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SteamNewsModel implements SteamNewsModel {
  const _SteamNewsModel({required this.appnews});
  factory _SteamNewsModel.fromJson(Map<String, dynamic> json) =>
      _$SteamNewsModelFromJson(json);

  @override
  final AppNews appnews;

  /// Create a copy of SteamNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SteamNewsModelCopyWith<_SteamNewsModel> get copyWith =>
      __$SteamNewsModelCopyWithImpl<_SteamNewsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SteamNewsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SteamNewsModel &&
            (identical(other.appnews, appnews) || other.appnews == appnews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appnews);

  @override
  String toString() {
    return 'SteamNewsModel(appnews: $appnews)';
  }
}

/// @nodoc
abstract mixin class _$SteamNewsModelCopyWith<$Res>
    implements $SteamNewsModelCopyWith<$Res> {
  factory _$SteamNewsModelCopyWith(
          _SteamNewsModel value, $Res Function(_SteamNewsModel) _then) =
      __$SteamNewsModelCopyWithImpl;
  @override
  @useResult
  $Res call({AppNews appnews});

  @override
  $AppNewsCopyWith<$Res> get appnews;
}

/// @nodoc
class __$SteamNewsModelCopyWithImpl<$Res>
    implements _$SteamNewsModelCopyWith<$Res> {
  __$SteamNewsModelCopyWithImpl(this._self, this._then);

  final _SteamNewsModel _self;
  final $Res Function(_SteamNewsModel) _then;

  /// Create a copy of SteamNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appnews = null,
  }) {
    return _then(_SteamNewsModel(
      appnews: null == appnews
          ? _self.appnews
          : appnews // ignore: cast_nullable_to_non_nullable
              as AppNews,
    ));
  }

  /// Create a copy of SteamNewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppNewsCopyWith<$Res> get appnews {
    return $AppNewsCopyWith<$Res>(_self.appnews, (value) {
      return _then(_self.copyWith(appnews: value));
    });
  }
}

/// @nodoc
mixin _$AppNews {
  int get appid;
  @JsonKey(name: 'newsitems')
  List<SteamNewsItemModel> get newsItems;

  /// Create a copy of AppNews
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppNewsCopyWith<AppNews> get copyWith =>
      _$AppNewsCopyWithImpl<AppNews>(this as AppNews, _$identity);

  /// Serializes this AppNews to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppNews &&
            (identical(other.appid, appid) || other.appid == appid) &&
            const DeepCollectionEquality().equals(other.newsItems, newsItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, appid, const DeepCollectionEquality().hash(newsItems));

  @override
  String toString() {
    return 'AppNews(appid: $appid, newsItems: $newsItems)';
  }
}

/// @nodoc
abstract mixin class $AppNewsCopyWith<$Res> {
  factory $AppNewsCopyWith(AppNews value, $Res Function(AppNews) _then) =
      _$AppNewsCopyWithImpl;
  @useResult
  $Res call(
      {int appid,
      @JsonKey(name: 'newsitems') List<SteamNewsItemModel> newsItems});
}

/// @nodoc
class _$AppNewsCopyWithImpl<$Res> implements $AppNewsCopyWith<$Res> {
  _$AppNewsCopyWithImpl(this._self, this._then);

  final AppNews _self;
  final $Res Function(AppNews) _then;

  /// Create a copy of AppNews
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appid = null,
    Object? newsItems = null,
  }) {
    return _then(_self.copyWith(
      appid: null == appid
          ? _self.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as int,
      newsItems: null == newsItems
          ? _self.newsItems
          : newsItems // ignore: cast_nullable_to_non_nullable
              as List<SteamNewsItemModel>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AppNews].
extension AppNewsPatterns on AppNews {
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
    TResult Function(_AppNews value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppNews() when $default != null:
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
    TResult Function(_AppNews value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNews():
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
    TResult? Function(_AppNews value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNews() when $default != null:
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
    TResult Function(int appid,
            @JsonKey(name: 'newsitems') List<SteamNewsItemModel> newsItems)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppNews() when $default != null:
        return $default(_that.appid, _that.newsItems);
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
    TResult Function(int appid,
            @JsonKey(name: 'newsitems') List<SteamNewsItemModel> newsItems)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNews():
        return $default(_that.appid, _that.newsItems);
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
    TResult? Function(int appid,
            @JsonKey(name: 'newsitems') List<SteamNewsItemModel> newsItems)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNews() when $default != null:
        return $default(_that.appid, _that.newsItems);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AppNews implements AppNews {
  const _AppNews(
      {required this.appid,
      @JsonKey(name: 'newsitems')
      required final List<SteamNewsItemModel> newsItems})
      : _newsItems = newsItems;
  factory _AppNews.fromJson(Map<String, dynamic> json) =>
      _$AppNewsFromJson(json);

  @override
  final int appid;
  final List<SteamNewsItemModel> _newsItems;
  @override
  @JsonKey(name: 'newsitems')
  List<SteamNewsItemModel> get newsItems {
    if (_newsItems is EqualUnmodifiableListView) return _newsItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsItems);
  }

  /// Create a copy of AppNews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppNewsCopyWith<_AppNews> get copyWith =>
      __$AppNewsCopyWithImpl<_AppNews>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppNewsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppNews &&
            (identical(other.appid, appid) || other.appid == appid) &&
            const DeepCollectionEquality()
                .equals(other._newsItems, _newsItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, appid, const DeepCollectionEquality().hash(_newsItems));

  @override
  String toString() {
    return 'AppNews(appid: $appid, newsItems: $newsItems)';
  }
}

/// @nodoc
abstract mixin class _$AppNewsCopyWith<$Res> implements $AppNewsCopyWith<$Res> {
  factory _$AppNewsCopyWith(_AppNews value, $Res Function(_AppNews) _then) =
      __$AppNewsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int appid,
      @JsonKey(name: 'newsitems') List<SteamNewsItemModel> newsItems});
}

/// @nodoc
class __$AppNewsCopyWithImpl<$Res> implements _$AppNewsCopyWith<$Res> {
  __$AppNewsCopyWithImpl(this._self, this._then);

  final _AppNews _self;
  final $Res Function(_AppNews) _then;

  /// Create a copy of AppNews
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appid = null,
    Object? newsItems = null,
  }) {
    return _then(_AppNews(
      appid: null == appid
          ? _self.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as int,
      newsItems: null == newsItems
          ? _self._newsItems
          : newsItems // ignore: cast_nullable_to_non_nullable
              as List<SteamNewsItemModel>,
    ));
  }
}

/// @nodoc
mixin _$SteamNewsItemModel {
  String get gid;
  String get title;
  String get url;
  @JsonKey(name: 'is_external_url')
  bool get isExternalUrl;
  String get author;
  String get contents;
  @JsonKey(name: 'feedlabel')
  String get feedLabel;
  int get date;
  @JsonKey(name: 'feedname')
  String get feedName;
  @JsonKey(name: 'feed_type')
  int get feedType;
  int get appid;

  /// Create a copy of SteamNewsItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SteamNewsItemModelCopyWith<SteamNewsItemModel> get copyWith =>
      _$SteamNewsItemModelCopyWithImpl<SteamNewsItemModel>(
          this as SteamNewsItemModel, _$identity);

  /// Serializes this SteamNewsItemModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SteamNewsItemModel &&
            (identical(other.gid, gid) || other.gid == gid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isExternalUrl, isExternalUrl) ||
                other.isExternalUrl == isExternalUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.feedLabel, feedLabel) ||
                other.feedLabel == feedLabel) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.feedName, feedName) ||
                other.feedName == feedName) &&
            (identical(other.feedType, feedType) ||
                other.feedType == feedType) &&
            (identical(other.appid, appid) || other.appid == appid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gid, title, url, isExternalUrl,
      author, contents, feedLabel, date, feedName, feedType, appid);

  @override
  String toString() {
    return 'SteamNewsItemModel(gid: $gid, title: $title, url: $url, isExternalUrl: $isExternalUrl, author: $author, contents: $contents, feedLabel: $feedLabel, date: $date, feedName: $feedName, feedType: $feedType, appid: $appid)';
  }
}

/// @nodoc
abstract mixin class $SteamNewsItemModelCopyWith<$Res> {
  factory $SteamNewsItemModelCopyWith(
          SteamNewsItemModel value, $Res Function(SteamNewsItemModel) _then) =
      _$SteamNewsItemModelCopyWithImpl;
  @useResult
  $Res call(
      {String gid,
      String title,
      String url,
      @JsonKey(name: 'is_external_url') bool isExternalUrl,
      String author,
      String contents,
      @JsonKey(name: 'feedlabel') String feedLabel,
      int date,
      @JsonKey(name: 'feedname') String feedName,
      @JsonKey(name: 'feed_type') int feedType,
      int appid});
}

/// @nodoc
class _$SteamNewsItemModelCopyWithImpl<$Res>
    implements $SteamNewsItemModelCopyWith<$Res> {
  _$SteamNewsItemModelCopyWithImpl(this._self, this._then);

  final SteamNewsItemModel _self;
  final $Res Function(SteamNewsItemModel) _then;

  /// Create a copy of SteamNewsItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gid = null,
    Object? title = null,
    Object? url = null,
    Object? isExternalUrl = null,
    Object? author = null,
    Object? contents = null,
    Object? feedLabel = null,
    Object? date = null,
    Object? feedName = null,
    Object? feedType = null,
    Object? appid = null,
  }) {
    return _then(_self.copyWith(
      gid: null == gid
          ? _self.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isExternalUrl: null == isExternalUrl
          ? _self.isExternalUrl
          : isExternalUrl // ignore: cast_nullable_to_non_nullable
              as bool,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _self.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      feedLabel: null == feedLabel
          ? _self.feedLabel
          : feedLabel // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      feedName: null == feedName
          ? _self.feedName
          : feedName // ignore: cast_nullable_to_non_nullable
              as String,
      feedType: null == feedType
          ? _self.feedType
          : feedType // ignore: cast_nullable_to_non_nullable
              as int,
      appid: null == appid
          ? _self.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [SteamNewsItemModel].
extension SteamNewsItemModelPatterns on SteamNewsItemModel {
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
    TResult Function(_SteamNewsItemModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamNewsItemModel() when $default != null:
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
    TResult Function(_SteamNewsItemModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsItemModel():
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
    TResult? Function(_SteamNewsItemModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsItemModel() when $default != null:
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
            String gid,
            String title,
            String url,
            @JsonKey(name: 'is_external_url') bool isExternalUrl,
            String author,
            String contents,
            @JsonKey(name: 'feedlabel') String feedLabel,
            int date,
            @JsonKey(name: 'feedname') String feedName,
            @JsonKey(name: 'feed_type') int feedType,
            int appid)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SteamNewsItemModel() when $default != null:
        return $default(
            _that.gid,
            _that.title,
            _that.url,
            _that.isExternalUrl,
            _that.author,
            _that.contents,
            _that.feedLabel,
            _that.date,
            _that.feedName,
            _that.feedType,
            _that.appid);
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
            String gid,
            String title,
            String url,
            @JsonKey(name: 'is_external_url') bool isExternalUrl,
            String author,
            String contents,
            @JsonKey(name: 'feedlabel') String feedLabel,
            int date,
            @JsonKey(name: 'feedname') String feedName,
            @JsonKey(name: 'feed_type') int feedType,
            int appid)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsItemModel():
        return $default(
            _that.gid,
            _that.title,
            _that.url,
            _that.isExternalUrl,
            _that.author,
            _that.contents,
            _that.feedLabel,
            _that.date,
            _that.feedName,
            _that.feedType,
            _that.appid);
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
            String gid,
            String title,
            String url,
            @JsonKey(name: 'is_external_url') bool isExternalUrl,
            String author,
            String contents,
            @JsonKey(name: 'feedlabel') String feedLabel,
            int date,
            @JsonKey(name: 'feedname') String feedName,
            @JsonKey(name: 'feed_type') int feedType,
            int appid)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SteamNewsItemModel() when $default != null:
        return $default(
            _that.gid,
            _that.title,
            _that.url,
            _that.isExternalUrl,
            _that.author,
            _that.contents,
            _that.feedLabel,
            _that.date,
            _that.feedName,
            _that.feedType,
            _that.appid);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SteamNewsItemModel implements SteamNewsItemModel {
  const _SteamNewsItemModel(
      {required this.gid,
      required this.title,
      required this.url,
      @JsonKey(name: 'is_external_url') this.isExternalUrl = false,
      required this.author,
      required this.contents,
      @JsonKey(name: 'feedlabel') required this.feedLabel,
      required this.date,
      @JsonKey(name: 'feedname') required this.feedName,
      @JsonKey(name: 'feed_type') required this.feedType,
      required this.appid});
  factory _SteamNewsItemModel.fromJson(Map<String, dynamic> json) =>
      _$SteamNewsItemModelFromJson(json);

  @override
  final String gid;
  @override
  final String title;
  @override
  final String url;
  @override
  @JsonKey(name: 'is_external_url')
  final bool isExternalUrl;
  @override
  final String author;
  @override
  final String contents;
  @override
  @JsonKey(name: 'feedlabel')
  final String feedLabel;
  @override
  final int date;
  @override
  @JsonKey(name: 'feedname')
  final String feedName;
  @override
  @JsonKey(name: 'feed_type')
  final int feedType;
  @override
  final int appid;

  /// Create a copy of SteamNewsItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SteamNewsItemModelCopyWith<_SteamNewsItemModel> get copyWith =>
      __$SteamNewsItemModelCopyWithImpl<_SteamNewsItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SteamNewsItemModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SteamNewsItemModel &&
            (identical(other.gid, gid) || other.gid == gid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isExternalUrl, isExternalUrl) ||
                other.isExternalUrl == isExternalUrl) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.feedLabel, feedLabel) ||
                other.feedLabel == feedLabel) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.feedName, feedName) ||
                other.feedName == feedName) &&
            (identical(other.feedType, feedType) ||
                other.feedType == feedType) &&
            (identical(other.appid, appid) || other.appid == appid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gid, title, url, isExternalUrl,
      author, contents, feedLabel, date, feedName, feedType, appid);

  @override
  String toString() {
    return 'SteamNewsItemModel(gid: $gid, title: $title, url: $url, isExternalUrl: $isExternalUrl, author: $author, contents: $contents, feedLabel: $feedLabel, date: $date, feedName: $feedName, feedType: $feedType, appid: $appid)';
  }
}

/// @nodoc
abstract mixin class _$SteamNewsItemModelCopyWith<$Res>
    implements $SteamNewsItemModelCopyWith<$Res> {
  factory _$SteamNewsItemModelCopyWith(
          _SteamNewsItemModel value, $Res Function(_SteamNewsItemModel) _then) =
      __$SteamNewsItemModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String gid,
      String title,
      String url,
      @JsonKey(name: 'is_external_url') bool isExternalUrl,
      String author,
      String contents,
      @JsonKey(name: 'feedlabel') String feedLabel,
      int date,
      @JsonKey(name: 'feedname') String feedName,
      @JsonKey(name: 'feed_type') int feedType,
      int appid});
}

/// @nodoc
class __$SteamNewsItemModelCopyWithImpl<$Res>
    implements _$SteamNewsItemModelCopyWith<$Res> {
  __$SteamNewsItemModelCopyWithImpl(this._self, this._then);

  final _SteamNewsItemModel _self;
  final $Res Function(_SteamNewsItemModel) _then;

  /// Create a copy of SteamNewsItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gid = null,
    Object? title = null,
    Object? url = null,
    Object? isExternalUrl = null,
    Object? author = null,
    Object? contents = null,
    Object? feedLabel = null,
    Object? date = null,
    Object? feedName = null,
    Object? feedType = null,
    Object? appid = null,
  }) {
    return _then(_SteamNewsItemModel(
      gid: null == gid
          ? _self.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isExternalUrl: null == isExternalUrl
          ? _self.isExternalUrl
          : isExternalUrl // ignore: cast_nullable_to_non_nullable
              as bool,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _self.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      feedLabel: null == feedLabel
          ? _self.feedLabel
          : feedLabel // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      feedName: null == feedName
          ? _self.feedName
          : feedName // ignore: cast_nullable_to_non_nullable
              as String,
      feedType: null == feedType
          ? _self.feedType
          : feedType // ignore: cast_nullable_to_non_nullable
              as int,
      appid: null == appid
          ? _self.appid
          : appid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
