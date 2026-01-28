import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/news_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = NewsInitial;
  const factory NewsState.loading() = NewsLoading;
  const factory NewsState.loaded(List<NewsItem> news) = NewsLoaded;
  const factory NewsState.error(Failure failure) = NewsError;
}
