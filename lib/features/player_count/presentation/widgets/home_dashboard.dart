import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_bloc.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_event.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_state.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/best_server_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/hourly_heatmap_widget.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/news_section.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/ping_estimator_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/player_count_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/rarest_achievements_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/region_distribution_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({
    required this.state,
    super.key,
  });

  final PlayerCountState state;

  @override
  Widget build(BuildContext context) {
    final playerCount = state.maybeWhen(
      loaded: (count, _, __, ___, ____, _____) => count,
      refreshing: (count, _, __, ___) => count,
      error: (_, count, __, ___, ____) => count,
      orElse: () => null,
    )!;

    final distribution = state.maybeWhen(
      loaded: (_, dist, __, ___, ____, _____) => dist,
      refreshing: (_, dist, __, ___) => dist,
      orElse: RegionalDistribution.empty,
    );

    final selectedRegion = state.maybeMap(
      loaded: (s) => s.selectedRegion,
      refreshing: (s) => s.selectedRegion,
      error: (s) => s.selectedRegion,
      orElse: () => null,
    );

    final isRefreshing = state.maybeMap(
      refreshing: (_) => true,
      loaded: (s) => s.isRefreshing,
      orElse: () => false,
    );

    final lastKnownCount = state.maybeMap(
      error: (s) => s.lastKnownCount,
      orElse: () => null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state is PlayerCountError && lastKnownCount != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 400),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, -10 * (1 - value)),
                    child: child,
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_off, size: 18, color: AppColors.error),
                    SizedBox(width: 8),
                    Text(
                      'Connection lost. Showing cached data.',
                      style: GoogleFonts.barlow(
                        color: AppColors.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (isRefreshing)
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: LinearProgressIndicator(
              color: AppColors.primary,
              backgroundColor: Colors.transparent,
              minHeight: 2,
            ),
          ),
        LayoutBuilder(
          builder: (context, constraints) {
            // Responsive layout
            if (constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: PlayerCountCard(count: playerCount),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 6,
                    child: RegionDistributionChart(
                      distribution: distribution,
                      selectedRegion: selectedRegion,
                      onRegionSelected: (region) {
                        context.read<PlayerCountBloc>().add(
                              PlayerCountEvent.regionSelected(region),
                            );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  PlayerCountCard(count: playerCount),
                  const SizedBox(height: 24),
                  RegionDistributionChart(
                    distribution: distribution,
                    selectedRegion: selectedRegion,
                    onRegionSelected: (region) {
                      context.read<PlayerCountBloc>().add(PlayerCountEvent.regionSelected(region));
                    },
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 32),
        // Core Feature: Best Server
        BestServerCard(distribution: distribution),
        const SizedBox(height: 32),
        // Core Feature: Ping Estimator
        const PingEstimatorCard(),

        const SizedBox(height: 48),
        const Divider(color: Colors.white10),
        const SizedBox(height: 32),

        // New Features Section
        Text(
          'ADVANCED ANALYTICS',
          style: GoogleFonts.orbitron(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 24),

        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: HourlyHeatmapWidget()),
                  const SizedBox(width: 24),
                  const Expanded(child: RarestAchievementsCard()),
                ],
              );
            } else {
              return Column(
                children: [
                  const HourlyHeatmapWidget(),
                  const SizedBox(height: 32),
                  const RarestAchievementsCard(),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 32),
        const NewsSection(),
      ],
    );
  }
}
