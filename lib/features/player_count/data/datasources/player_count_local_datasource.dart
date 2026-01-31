import 'dart:convert';

import 'package:arc_raiders_tracker/core/error/exceptions.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PlayerCountLocalDataSource {
  Future<void> cachePlayerCount(PlayerCount count);
  Future<PlayerCount?> getLastPlayerCount();
}

const cachedPlayerCountKey = 'CACHED_PLAYER_COUNT';

@LazySingleton(as: PlayerCountLocalDataSource)
class PlayerCountLocalDataSourceImpl implements PlayerCountLocalDataSource {
  PlayerCountLocalDataSourceImpl(this._prefsWrapper);
  final PrefsWrapper _prefsWrapper;

  @override
  Future<void> cachePlayerCount(PlayerCount count) async {
    final prefs = await _prefsWrapper.prefs;
    // We only cache the steam player count part for now, or the full entity
    // Ideally we convert entity -> model -> json
    // For simplicity, we'll store basic fields
    final jsonMap = {
      'player_count': count.totalPlayers,
      'timestamp': count.timestamp.toIso8601String(),
    };
    await prefs.setString(cachedPlayerCountKey, json.encode(jsonMap));
  }

  @override
  Future<PlayerCount?> getLastPlayerCount() async {
    final prefs = await _prefsWrapper.prefs;
    final jsonString = prefs.getString(cachedPlayerCountKey);
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
        throw const CacheException(message: 'Invalid cache format');
      }
    }
    return null;
  }
}

@lazySingleton
class PrefsWrapper {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
}
