import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/news_item.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGameNews {
  GetGameNews(this._repository);

  final NewsRepository _repository;

  Future<Either<Failure, List<NewsItem>>> call(int appId) async {
    return _repository.getGameNews(appId);
  }
}
