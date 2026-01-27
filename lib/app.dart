import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'features/player_count/presentation/bloc/player_count_bloc.dart';
import 'features/player_count/presentation/bloc/player_count_event.dart';
import 'features/player_count/presentation/pages/home_page.dart';

class ArcRaidersTrackerApp extends StatelessWidget {
  const ArcRaidersTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arc Raiders Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: BlocProvider(
        create: (context) => getIt<PlayerCountBloc>()..add(const PlayerCountEvent.started()),
        child: const HomePage(),
      ),
    );
  }
}
