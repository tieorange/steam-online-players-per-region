import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/steam_player_count_model.dart';

part 'steam_remote_datasource.g.dart';

@RestApi(baseUrl: ApiConstants.steamBaseUrl)
abstract class SteamApiClient {
  factory SteamApiClient(Dio dio, {String baseUrl}) = _SteamApiClient;

  @GET("/ISteamUserStats/GetNumberOfCurrentPlayers/v1/")
  Future<dynamic> getCurrentPlayers(
    @Query("appid") int appId,
    @Query("key") String? apiKey,
  );
}

abstract class SteamRemoteDataSource {
  Future<SteamPlayerCountModel> getCurrentPlayerCount();
}

@LazySingleton(as: SteamRemoteDataSource)
class SteamRemoteDataSourceImpl implements SteamRemoteDataSource {
  final SteamApiClient _client;
  static const _maxRetries = 3;
  static const _baseDelay = Duration(seconds: 1);

  SteamRemoteDataSourceImpl(Dio dio) : _client = SteamApiClient(dio);

  @override
  Future<SteamPlayerCountModel> getCurrentPlayerCount() async {
    Exception? lastException;

    for (var attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        final response = await _client
            .getCurrentPlayers(ApiConstants.arcRaidersAppId, null)
            .timeout(const Duration(seconds: 10));
        return SteamPlayerCountModel.fromResponse(response as Map<String, dynamic>);
      } on DioException catch (e) {
        lastException = _mapDioException(e);
        if (!_isRetryable(e)) rethrow;
        await Future.delayed(_baseDelay * (attempt + 1));
      } on TimeoutException {
        lastException = TimeoutException('Request timed out');
        await Future.delayed(_baseDelay * (attempt + 1));
      }
    }

    throw lastException ?? ServerException(message: 'Unknown error after retries');
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
