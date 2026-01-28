// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsState()';
  }
}

/// @nodoc
class $NewsStateCopyWith<$Res> {
  $NewsStateCopyWith(NewsState _, $Res Function(NewsState) __);
}

/// Adds pattern-matching-related methods to [NewsState].
extension NewsStatePatterns on NewsState {
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
    TResult Function(NewsInitial value)? initial,
    TResult Function(NewsLoading value)? loading,
    TResult Function(NewsLoaded value)? loaded,
    TResult Function(NewsError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NewsInitial() when initial != null:
        return initial(_that);
      case NewsLoading() when loading != null:
        return loading(_that);
      case NewsLoaded() when loaded != null:
        return loaded(_that);
      case NewsError() when error != null:
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
    required TResult Function(NewsInitial value) initial,
    required TResult Function(NewsLoading value) loading,
    required TResult Function(NewsLoaded value) loaded,
    required TResult Function(NewsError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsInitial():
        return initial(_that);
      case NewsLoading():
        return loading(_that);
      case NewsLoaded():
        return loaded(_that);
      case NewsError():
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
    TResult? Function(NewsInitial value)? initial,
    TResult? Function(NewsLoading value)? loading,
    TResult? Function(NewsLoaded value)? loaded,
    TResult? Function(NewsError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsInitial() when initial != null:
        return initial(_that);
      case NewsLoading() when loading != null:
        return loading(_that);
      case NewsLoaded() when loaded != null:
        return loaded(_that);
      case NewsError() when error != null:
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
    TResult Function(List<NewsItem> news)? loaded,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NewsInitial() when initial != null:
        return initial();
      case NewsLoading() when loading != null:
        return loading();
      case NewsLoaded() when loaded != null:
        return loaded(_that.news);
      case NewsError() when error != null:
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
    required TResult Function(List<NewsItem> news) loaded,
    required TResult Function(Failure failure) error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsInitial():
        return initial();
      case NewsLoading():
        return loading();
      case NewsLoaded():
        return loaded(_that.news);
      case NewsError():
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
    TResult? Function(List<NewsItem> news)? loaded,
    TResult? Function(Failure failure)? error,
  }) {
    final _that = this;
    switch (_that) {
      case NewsInitial() when initial != null:
        return initial();
      case NewsLoading() when loading != null:
        return loading();
      case NewsLoaded() when loaded != null:
        return loaded(_that.news);
      case NewsError() when error != null:
        return error(_that.failure);
      case _:
        return null;
    }
  }
}

/// @nodoc

class NewsInitial implements NewsState {
  const NewsInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsState.initial()';
  }
}

/// @nodoc

class NewsLoading implements NewsState {
  const NewsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NewsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NewsState.loading()';
  }
}

/// @nodoc

class NewsLoaded implements NewsState {
  const NewsLoaded(final List<NewsItem> news) : _news = news;

  final List<NewsItem> _news;
  List<NewsItem> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsLoadedCopyWith<NewsLoaded> get copyWith =>
      _$NewsLoadedCopyWithImpl<NewsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsLoaded &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  @override
  String toString() {
    return 'NewsState.loaded(news: $news)';
  }
}

/// @nodoc
abstract mixin class $NewsLoadedCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory $NewsLoadedCopyWith(
          NewsLoaded value, $Res Function(NewsLoaded) _then) =
      _$NewsLoadedCopyWithImpl;
  @useResult
  $Res call({List<NewsItem> news});
}

/// @nodoc
class _$NewsLoadedCopyWithImpl<$Res> implements $NewsLoadedCopyWith<$Res> {
  _$NewsLoadedCopyWithImpl(this._self, this._then);

  final NewsLoaded _self;
  final $Res Function(NewsLoaded) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? news = null,
  }) {
    return _then(NewsLoaded(
      null == news
          ? _self._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsItem>,
    ));
  }
}

/// @nodoc

class NewsError implements NewsState {
  const NewsError(this.failure);

  final Failure failure;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsErrorCopyWith<NewsError> get copyWith =>
      _$NewsErrorCopyWithImpl<NewsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsError &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @override
  String toString() {
    return 'NewsState.error(failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $NewsErrorCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory $NewsErrorCopyWith(NewsError value, $Res Function(NewsError) _then) =
      _$NewsErrorCopyWithImpl;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class _$NewsErrorCopyWithImpl<$Res> implements $NewsErrorCopyWith<$Res> {
  _$NewsErrorCopyWithImpl(this._self, this._then);

  final NewsError _self;
  final $Res Function(NewsError) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? failure = null,
  }) {
    return _then(NewsError(
      null == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

// dart format on
