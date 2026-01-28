import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item.freezed.dart';

@freezed
sealed class NewsItem with _$NewsItem {
  const factory NewsItem({
    required String title,
    required String url,
    required String author,
    required String contents,
    required DateTime date,
    required String feedLabel,
  }) = _NewsItem;
}
