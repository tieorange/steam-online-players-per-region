import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:arc_raiders_tracker/core/constants/api_constants.dart';
import 'package:arc_raiders_tracker/core/error/exceptions.dart';
import 'package:arc_raiders_tracker/features/player_count/data/models/steam_achievement_model.dart';
import 'package:arc_raiders_tracker/features/player_count/data/models/steam_news_model.dart';
import 'package:arc_raiders_tracker/features/player_count/data/models/steam_player_count_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'steam_remote_datasource.g.dart';

@RestApi(baseUrl: ApiConstants.steamBaseUrl)
abstract class SteamApiClient {
  factory SteamApiClient(Dio dio, {String baseUrl}) = _SteamApiClient;

  @GET('/ISteamUserStats/GetNumberOfCurrentPlayers/v1/')
  Future<dynamic> getCurrentPlayers(
    @Query('appid') int appId,
    @Query('key') String? apiKey,
  );

  @GET('/ISteamNews/GetNewsForApp/v2/')
  Future<dynamic> getNewsForApp(
    @Query('appid') int appId,
    @Query('count') int count,
    @Query('maxlength') int maxlength,
  );

  @GET('/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/')
  Future<dynamic> getGlobalAchievementPercentagesForApp(
    @Query('gameid') int gameId,
    @Query('key') String? apiKey,
  );
}

abstract class SteamRemoteDataSource {
  Future<SteamPlayerCountModel> getCurrentPlayerCount(int appId);
  Future<SteamNewsModel> getGameNews(int appId);
  Future<SteamAchievementModel> getAchievementPercentages(int appId);
}

@LazySingleton(as: SteamRemoteDataSource)
class SteamRemoteDataSourceImpl implements SteamRemoteDataSource {
  SteamRemoteDataSourceImpl(Dio dio) : _client = SteamApiClient(dio) {
    if (kIsWeb) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            if (kDebugMode) {
              final originalUri = options.uri;
              // Extract the path from the original URI manually because Retrofit combines baseUrl and path
              // We need to send "ISteamNews/GetNewsForApp/v2/" as the 'path' query param

              // The originalUri.path will be something like "/ISteamNews/GetNewsForApp/v2/"
              // We strip the leading slash
              final apiPath = originalUri.path.startsWith('/')
                  ? originalUri.path.substring(1)
                  : originalUri.path;

              options.path =
                  'https://corsproxy.io/?url=${Uri.encodeComponent('https://api.steampowered.com/$apiPath?${originalUri.query}')}';

              // However, our Vercel proxy logic is: /api/proxy?path=...&queryParams...
              // But for LOCAL debugging with kDebugMode, we might use corsproxy.io directly OR our local dev server if running.
              // Let's stick to the previous pattern but updated.
              // Actually, previous pattern was: options.path = 'https://corsproxy.io/?$originalUri';
              // But that assumes originalUri is the full target.
              // Retrofit sends request to baseUrl + path.

              // Let's just use the Vercel proxy logic for Web in general, assuming we might deploy or run locally.
              // If running `flutter run -d chrome`, we can't easily hit the Vercel function unless it's deployed.
              // So for local dev, we might still need a direct proxy like corsproxy.io

              // Simplified approach for now:
              // If we are using the Vercel proxy (production web):
              // path = '/api/proxy'
              // queryParameters = { 'path': apiPath, ...originalQuery }
            } else {
              final apiPath =
                  options.path.startsWith('/') ? options.path.substring(1) : options.path;

              options.path = '/api/proxy';
              options.baseUrl = '';
              final newQuery = Map<String, dynamic>.from(options.queryParameters);
              newQuery['path'] = apiPath;
              options.queryParameters = newQuery;
            }
            handler.next(options);
          },
        ),
      );
    }
  }
  final SteamApiClient _client;
  static const _maxRetries = 3;
  static const _baseDelay = Duration(seconds: 1);

  @override
  Future<SteamPlayerCountModel> getCurrentPlayerCount(int appId) async {
    Exception? lastException;

    for (var attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        final response = await _client
            .getCurrentPlayers(appId, dotenv.env['STEAM_API_KEY'])
            .timeout(const Duration(seconds: 10));
        return SteamPlayerCountModel.fromResponse(response as Map<String, dynamic>);
      } on DioException catch (e) {
        lastException = _mapDioException(e);
        if (!_isRetryable(e)) rethrow;
        await Future<void>.delayed(_baseDelay * (attempt + 1));
      } on TimeoutException {
        lastException = TimeoutException('Request timed out');
        await Future<void>.delayed(_baseDelay * (attempt + 1));
      }
    }

    throw lastException ?? const ServerException(message: 'Unknown error after retries');
  }

  @override
  Future<SteamNewsModel> getGameNews(int appId) async {
    try {
      final response =
          await _client.getNewsForApp(appId, 3, 300).timeout(const Duration(seconds: 10));
      return SteamNewsModel.fromJson(response as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioException(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<SteamAchievementModel> getAchievementPercentages(int appId) async {
    try {
      final response = await _client
          .getGlobalAchievementPercentagesForApp(appId, dotenv.env['STEAM_API_KEY'])
          .timeout(const Duration(seconds: 10));
      return SteamAchievementModel.fromJson(response as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioException(e);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  bool _isRetryable(DioException e) => switch (e.type) {
        DioExceptionType.connectionTimeout => true,
        DioExceptionType.receiveTimeout => true,
        DioExceptionType.connectionError => true,
        _ => false,
      };

  Exception _mapDioException(DioException e) => switch (e.type) {
        DioExceptionType.connectionError => NetworkException(message: e.message ?? 'No connection'),
        DioExceptionType.badResponse => ServerException(
            message: e.message ?? 'Server error',
            statusCode: e.response?.statusCode,
          ),
        _ => ServerException(message: e.message ?? 'Unknown error'),
      };
}
