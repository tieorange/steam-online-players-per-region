// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsItem {
  String get title;
  String get url;
  String get author;
  String get contents;
  DateTime get date;
  String get feedLabel;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsItemCopyWith<NewsItem> get copyWith =>
      _$NewsItemCopyWithImpl<NewsItem>(this as NewsItem, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.feedLabel, feedLabel) ||
                other.feedLabel == feedLabel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, url, author, contents, date, feedLabel);

  @override
  String toString() {
    return 'NewsItem(title: $title, url: $url, author: $author, contents: $contents, date: $date, feedLabel: $feedLabel)';
  }
}

/// @nodoc
abstract mixin class $NewsItemCopyWith<$Res> {
  factory $NewsItemCopyWith(NewsItem value, $Res Function(NewsItem) _then) =
      _$NewsItemCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String url,
      String author,
      String contents,
      DateTime date,
      String feedLabel});
}

/// @nodoc
class _$NewsItemCopyWithImpl<$Res> implements $NewsItemCopyWith<$Res> {
  _$NewsItemCopyWithImpl(this._self, this._then);

  final NewsItem _self;
  final $Res Function(NewsItem) _then;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? author = null,
    Object? contents = null,
    Object? date = null,
    Object? feedLabel = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _self.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feedLabel: null == feedLabel
          ? _self.feedLabel
          : feedLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewsItem].
extension NewsItemPatterns on NewsItem {
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
    TResult Function(_NewsItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsItem() when $default != null:
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
    TResult Function(_NewsItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItem():
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
    TResult? Function(_NewsItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItem() when $default != null:
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
    TResult Function(String title, String url, String author, String contents,
            DateTime date, String feedLabel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsItem() when $default != null:
        return $default(_that.title, _that.url, _that.author, _that.contents,
            _that.date, _that.feedLabel);
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
    TResult Function(String title, String url, String author, String contents,
            DateTime date, String feedLabel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItem():
        return $default(_that.title, _that.url, _that.author, _that.contents,
            _that.date, _that.feedLabel);
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
    TResult? Function(String title, String url, String author, String contents,
            DateTime date, String feedLabel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsItem() when $default != null:
        return $default(_that.title, _that.url, _that.author, _that.contents,
            _that.date, _that.feedLabel);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewsItem implements NewsItem {
  const _NewsItem(
      {required this.title,
      required this.url,
      required this.author,
      required this.contents,
      required this.date,
      required this.feedLabel});

  @override
  final String title;
  @override
  final String url;
  @override
  final String author;
  @override
  final String contents;
  @override
  final DateTime date;
  @override
  final String feedLabel;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsItemCopyWith<_NewsItem> get copyWith =>
      __$NewsItemCopyWithImpl<_NewsItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.feedLabel, feedLabel) ||
                other.feedLabel == feedLabel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, url, author, contents, date, feedLabel);

  @override
  String toString() {
    return 'NewsItem(title: $title, url: $url, author: $author, contents: $contents, date: $date, feedLabel: $feedLabel)';
  }
}

/// @nodoc
abstract mixin class _$NewsItemCopyWith<$Res>
    implements $NewsItemCopyWith<$Res> {
  factory _$NewsItemCopyWith(_NewsItem value, $Res Function(_NewsItem) _then) =
      __$NewsItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String url,
      String author,
      String contents,
      DateTime date,
      String feedLabel});
}

/// @nodoc
class __$NewsItemCopyWithImpl<$Res> implements _$NewsItemCopyWith<$Res> {
  __$NewsItemCopyWithImpl(this._self, this._then);

  final _NewsItem _self;
  final $Res Function(_NewsItem) _then;

  /// Create a copy of NewsItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? url = null,
    Object? author = null,
    Object? contents = null,
    Object? date = null,
    Object? feedLabel = null,
  }) {
    return _then(_NewsItem(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _self.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      feedLabel: null == feedLabel
          ? _self.feedLabel
          : feedLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
