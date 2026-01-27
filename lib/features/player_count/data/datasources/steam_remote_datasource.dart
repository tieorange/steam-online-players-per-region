import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:arc_raiders_tracker/core/constants/api_constants.dart';
import 'package:arc_raiders_tracker/core/error/exceptions.dart';
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
}

abstract class SteamRemoteDataSource {
  Future<SteamPlayerCountModel> getCurrentPlayerCount();
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
              options.path = 'https://corsproxy.io/?$originalUri';
              options.baseUrl = '';
              options.queryParameters = {};
            } else {
              options.path = '/api/proxy';
              options.baseUrl = '';
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
  Future<SteamPlayerCountModel> getCurrentPlayerCount() async {
    Exception? lastException;

    for (var attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        final response = await _client
            .getCurrentPlayers(ApiConstants.arcRaidersAppId, dotenv.env['STEAM_API_KEY'])
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
