import 'package:arc_raiders_tracker/features/player_count/domain/usecases/get_game_news.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/news/news_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._getGameNews) : super(const NewsState.initial());

  final GetGameNews _getGameNews;

  Future<void> loadNews(int appId) async {
    emit(const NewsState.loading());
    final result = await _getGameNews(appId);
    emit(
      result.fold(
        (failure) => NewsState.error(failure),
        (news) => NewsState.loaded(news),
      ),
    );
  }
}
