import 'package:freezed_annotation/freezed_annotation.dart';

part 'steam_news_model.freezed.dart';
part 'steam_news_model.g.dart';

@freezed
sealed class SteamNewsModel with _$SteamNewsModel {
  const factory SteamNewsModel({
    required AppNews appnews,
  }) = _SteamNewsModel;

  factory SteamNewsModel.fromJson(Map<String, dynamic> json) => _$SteamNewsModelFromJson(json);
}

@freezed
sealed class AppNews with _$AppNews {
  const factory AppNews({
    required int appid,
    @JsonKey(name: 'newsitems') required List<SteamNewsItemModel> newsItems,
  }) = _AppNews;

  factory AppNews.fromJson(Map<String, dynamic> json) => _$AppNewsFromJson(json);
}

@freezed
sealed class SteamNewsItemModel with _$SteamNewsItemModel {
  const factory SteamNewsItemModel({
    required String gid,
    required String title,
    required String url,
    @JsonKey(name: 'is_external_url') @Default(false) bool isExternalUrl,
    required String author,
    required String contents,
    @JsonKey(name: 'feedlabel') required String feedLabel,
    required int date,
    @JsonKey(name: 'feedname') required String feedName,
    @JsonKey(name: 'feed_type') required int feedType,
    required int appid,
  }) = _SteamNewsItemModel;

  factory SteamNewsItemModel.fromJson(Map<String, dynamic> json) =>
      _$SteamNewsItemModelFromJson(json);
}
