import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/player_count.dart';
import '../models/steam_player_count_model.dart';

abstract class PlayerCountLocalDataSource {
  Future<void> cachePlayerCount(PlayerCount count);
  Future<PlayerCount?> getLastPlayerCount();
}

const cachedPlayerCountKey = 'CACHED_PLAYER_COUNT';

@LazySingleton(as: PlayerCountLocalDataSource)
class PlayerCountLocalDataSourceImpl implements PlayerCountLocalDataSource {
  final SharedPreferences _sharedPreferences;

  PlayerCountLocalDataSourceImpl(this._sharedPreferences);

  // We need to provide SharedPreferences via a synchronous accessor or future
  // For simplicity with injectable, we'll create a module for SharedPreferences later
  // Or assuming it's injected.

  @override
  Future<void> cachePlayerCount(PlayerCount count) async {
    // We only cache the steam player count part for now, or the full entity
    // Ideally we convert entity -> model -> json
    // For simplicity, we'll store basic fields
    final jsonMap = {
      'player_count': count.totalPlayers,
      'timestamp': count.timestamp.toIso8601String(),
    };
    await _sharedPreferences.setString(cachedPlayerCountKey, json.encode(jsonMap));
  }

  @override
  Future<PlayerCount?> getLastPlayerCount() async {
    final jsonString = _sharedPreferences.getString(cachedPlayerCountKey);
    if (jsonString != null) {
      try {
        final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
        return PlayerCount(
          totalPlayers: jsonMap['player_count'] as int,
          steamPlayers: jsonMap['player_count'] as int,
          timestamp: DateTime.parse(jsonMap['timestamp'] as String),
          source: PlayerCountSource.cached,
        );
      } catch (e) {
        throw CacheException(message: 'Invalid cache format');
      }
    }
    return null;
  }
}

@module
abstract class StorageModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
