import 'package:arc_raiders_tracker/core/error/exceptions.dart';
import 'package:arc_raiders_tracker/core/error/failures.dart';
import 'package:arc_raiders_tracker/features/player_count/data/datasources/steam_remote_datasource.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/achievement_stat.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/repositories/achievements_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AchievementsRepository)
class AchievementsRepositoryImpl implements AchievementsRepository {
  AchievementsRepositoryImpl(this._remoteDataSource);

  final SteamRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<AchievementStat>>> getRarestAchievements(int appId) async {
    try {
      final model = await _remoteDataSource.getAchievementPercentages(appId);
      final stats = model.achievementpercentages.achievements.map((item) {
        return AchievementStat(
          name: item.name,
          percent: item.percent,
          // Prettify common internal names if possible, else just use raw
          displayName: item.name.replaceAll('_', ' '),
        );
      }).toList();

      // Sort by rarity (ascending percent)
      stats.sort((a, b) => a.percent.compareTo(b.percent));

      // Take top 6 rarest
      final rarest = stats.take(6).toList();

      return Right(rarest);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
