// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SteamNewsModel _$SteamNewsModelFromJson(Map<String, dynamic> json) =>
    _SteamNewsModel(
      appnews: AppNews.fromJson(json['appnews'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SteamNewsModelToJson(_SteamNewsModel instance) =>
    <String, dynamic>{
      'appnews': instance.appnews,
    };

_AppNews _$AppNewsFromJson(Map<String, dynamic> json) => _AppNews(
      appid: (json['appid'] as num).toInt(),
      newsItems: (json['newsitems'] as List<dynamic>)
          .map((e) => SteamNewsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppNewsToJson(_AppNews instance) => <String, dynamic>{
      'appid': instance.appid,
      'newsitems': instance.newsItems,
    };

_SteamNewsItemModel _$SteamNewsItemModelFromJson(Map<String, dynamic> json) =>
    _SteamNewsItemModel(
      gid: json['gid'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      isExternalUrl: json['is_external_url'] as bool? ?? false,
      author: json['author'] as String,
      contents: json['contents'] as String,
      feedLabel: json['feedlabel'] as String,
      date: (json['date'] as num).toInt(),
      feedName: json['feedname'] as String,
      feedType: (json['feed_type'] as num).toInt(),
      appid: (json['appid'] as num).toInt(),
    );

Map<String, dynamic> _$SteamNewsItemModelToJson(_SteamNewsItemModel instance) =>
    <String, dynamic>{
      'gid': instance.gid,
      'title': instance.title,
      'url': instance.url,
      'is_external_url': instance.isExternalUrl,
      'author': instance.author,
      'contents': instance.contents,
      'feedlabel': instance.feedLabel,
      'date': instance.date,
      'feedname': instance.feedName,
      'feed_type': instance.feedType,
      'appid': instance.appid,
    };
