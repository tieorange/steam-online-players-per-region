import 'package:arc_raiders_tracker/core/constants/game_registry.dart';
import 'package:arc_raiders_tracker/core/di/injection.dart';
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/game_selector_cubit.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_bloc.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_event.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArcRaidersTrackerApp extends StatelessWidget {
  const ArcRaidersTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GameSelectorCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<PlayerCountBloc>()
            ..add(PlayerCountEvent.started(appId: GameRegistry.defaultGame.appId)),
        ),
      ],
      child: MaterialApp(
        title: 'Arc Raiders Tracker',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const HomePage(),
      ),
    );
  }
}
