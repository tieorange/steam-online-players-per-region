// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/player_count/data/datasources/player_count_local_datasource.dart'
    as _i24;
import '../../features/player_count/data/datasources/steam_remote_datasource.dart'
    as _i846;
import '../../features/player_count/data/repositories/player_count_repository_impl.dart'
    as _i335;
import '../../features/player_count/domain/repositories/player_count_repository.dart'
    as _i150;
import '../../features/player_count/domain/usecases/get_current_player_count.dart'
    as _i17;
import '../../features/player_count/domain/usecases/get_regional_estimates.dart'
    as _i500;
import '../../features/player_count/domain/usecases/stream_player_count.dart'
    as _i831;
import '../../features/player_count/presentation/bloc/player_count_bloc.dart'
    as _i985;
import '../network/dio_client.dart' as _i667;
import '../utils/region_estimator.dart' as _i442;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => storageModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i442.RegionEstimator>(() => _i442.RegionEstimator());
    gh.lazySingleton<_i846.SteamRemoteDataSource>(
        () => _i846.SteamRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i24.PlayerCountLocalDataSource>(() =>
        _i24.PlayerCountLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i150.PlayerCountRepository>(
        () => _i335.PlayerCountRepositoryImpl(
              gh<_i846.SteamRemoteDataSource>(),
              gh<_i24.PlayerCountLocalDataSource>(),
              gh<_i442.RegionEstimator>(),
            ));
    gh.lazySingleton<_i831.StreamPlayerCount>(
        () => _i831.StreamPlayerCount(gh<_i150.PlayerCountRepository>()));
    gh.lazySingleton<_i17.GetCurrentPlayerCount>(
        () => _i17.GetCurrentPlayerCount(gh<_i150.PlayerCountRepository>()));
    gh.lazySingleton<_i500.GetRegionalEstimates>(
        () => _i500.GetRegionalEstimates(gh<_i150.PlayerCountRepository>()));
    gh.factory<_i985.PlayerCountBloc>(() => _i985.PlayerCountBloc(
          gh<_i17.GetCurrentPlayerCount>(),
          gh<_i831.StreamPlayerCount>(),
          gh<_i500.GetRegionalEstimates>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i24.StorageModule {}

class _$NetworkModule extends _i667.NetworkModule {}
