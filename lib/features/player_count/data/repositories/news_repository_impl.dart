import 'package:arc_raiders_tracker/core/error/exceptions.dart';
import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/data/datasources/steam_remote_datasource.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/news_item.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl(this._remoteDataSource);

  final SteamRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<NewsItem>>> getGameNews(int appId) async {
    try {
      final steamNews = await _remoteDataSource.getGameNews(appId);
      final newsItems = steamNews.appnews.newsItems.map((item) {
        return NewsItem(
          title: item.title,
          url: item.url,
          author: item.author,
          contents: item.contents,
          date: DateTime.fromMillisecondsSinceEpoch(item.date * 1000),
          feedLabel: item.feedLabel,
        );
      }).toList();
      return Right(newsItems);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
