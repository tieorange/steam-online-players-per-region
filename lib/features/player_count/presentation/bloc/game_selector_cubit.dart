import 'package:arc_raiders_tracker/core/constants/game_registry.dart';
import 'package:arc_raiders_tracker/core/entities/game.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

/// Cubit to manage the currently selected game
@injectable
class GameSelectorCubit extends Cubit<Game> {
  GameSelectorCubit() : super(GameRegistry.defaultGame);

  void selectGame(Game game) => emit(game);

  /// Select game by index (useful for tab bar)
  void selectGameByIndex(int index) {
    if (index >= 0 && index < GameRegistry.all.length) {
      emit(GameRegistry.all[index]);
    }
  }

  /// Get index of currently selected game
  int get selectedIndex => GameRegistry.all.indexOf(state);
}
