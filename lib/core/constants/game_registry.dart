import 'package:arc_raiders_tracker/core/entities/game.dart';

/// Registry of all supported games
class GameRegistry {
  GameRegistry._();

  static const Game arcRaiders = Game(
    appId: 1808500,
    name: 'Arc Raiders',
    shortName: 'ARC',
  );

  static const Game battlefield6 = Game(
    appId: 2807960,
    name: 'Battlefield 6',
    shortName: 'BF6',
  );

  /// All available games. Arc Raiders is first (default).
  static List<Game> get all => [arcRaiders, battlefield6];

  /// Default game to show on app launch
  static Game get defaultGame => arcRaiders;
}
