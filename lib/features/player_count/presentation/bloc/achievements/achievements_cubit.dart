import 'package:arc_raiders_tracker/features/player_count/domain/usecases/get_global_achievements.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/achievements/achievements_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AchievementsCubit extends Cubit<AchievementsState> {
  AchievementsCubit(this._getGlobalAchievements) : super(const AchievementsState.initial());

  final GetGlobalAchievements _getGlobalAchievements;

  Future<void> loadAchievements(int appId) async {
    emit(const AchievementsState.loading());
    final result = await _getGlobalAchievements(appId);
    emit(
      result.fold(
        (failure) => AchievementsState.error(failure),
        (achievements) => AchievementsState.loaded(achievements),
      ),
    );
  }
}
