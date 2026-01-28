import 'package:arc_raiders_tracker/core/entities/game.dart';
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/game_selector_cubit.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_bloc.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_event.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_state.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/best_server_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/crt_overlay.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/error_view.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/game_tab_bar.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/live_indicator.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/ping_estimator_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/player_count_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/region_distribution_chart.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/shimmer_loading.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/user_clock.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/hourly_heatmap_widget.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/news_section.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/rarest_achievements_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/shareable_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PlayerCountBloc, PlayerCountState>(
        listener: (context, state) {
          if (state is PlayerCountLoaded && state.isRefreshing) {
            // Optional: show linear progress indicator at top
          }
          if (state is PlayerCountError && state.lastKnownCount != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failure.userFriendlyMessage),
                backgroundColor: AppColors.error,
                action: SnackBarAction(
                  label: 'RETRY',
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<PlayerCountBloc>().add(const PlayerCountEvent.retryRequested());
                  },
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final colors = ThemeColors.of(context);
          return CrtOverlay(
            enableFlicker: true,
            flickerIntensity: 0.01,
            scanLineOpacity: 0.03,
            child: Stack(
              children: [
                // Background Elements - VHS-era dark gradient
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.topCenter,
                        radius: 1.5,
                        colors: [AppColors.surface, AppColors.background],
                      ),
                    ),
                  ),
                ),

                // Main Content
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      backgroundColor: Colors.transparent,
                      title: BlocBuilder<GameSelectorCubit, Game>(
                        builder: (context, selectedGame) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                selectedGame.name.contains('Battlefield')
                                    ? Icons.military_tech
                                    : Icons.rocket_launch,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                selectedGame.name.toUpperCase(),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(width: 8),
                              Container(width: 1, height: 20, color: AppColors.textTertiary),
                              const SizedBox(width: 8),
                              Text(
                                'TRACKER',
                                style: GoogleFonts.orbitron(
                                  color: AppColors.textPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      actions: [
                        const Center(child: LiveIndicator()),
                        const SizedBox(width: 20),
                        IconButton(
                          onPressed: () => _showShareDialog(context, state),
                          icon: const Icon(Icons.share, color: AppColors.primary),
                          tooltip: 'Share Stats',
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SliverToBoxAdapter(
                      child: GameTabBar(),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverToBoxAdapter(
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1000),
                            child: _buildBody(context, state),
                          ),
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Data Source: Steam Web API',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: colors.textTertiary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Regional data is estimated based on timezone activity patterns.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: colors.textTertiary),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, PlayerCountState state) {
    return switch (state) {
      PlayerCountInitial() => const SizedBox.shrink(),
      PlayerCountLoading() => _buildLoadingState(context),
      PlayerCountError(:final failure, :final lastKnownCount) when lastKnownCount == null =>
        ErrorView(
          failure: failure,
          onRetry: () =>
              context.read<PlayerCountBloc>().add(const PlayerCountEvent.retryRequested()),
        ),

      // Loaded or Refreshing or Error-with-data
      _ => TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutQuad,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: child,
              ),
            );
          },
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: UserClock(),
              ),
              _buildDashboard(context, state),
            ],
          ),
        ),
    };
  }

  Widget _buildLoadingState(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: UserClock(),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 4,
                    child: ShimmerLoading(width: double.infinity, height: 300, borderRadius: 24),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 6,
                    child: ShimmerLoading(width: double.infinity, height: 400, borderRadius: 24),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  const ShimmerLoading(width: double.infinity, height: 300, borderRadius: 24),
                  const SizedBox(height: 24),
                  const ShimmerLoading(width: double.infinity, height: 400, borderRadius: 24),
                ],
              );
            }
          },
        ),
        const SizedBox(height: 24),
        const ShimmerLoading(width: double.infinity, height: 200, borderRadius: 24),
      ],
    );
  }

  Widget _buildDashboard(BuildContext context, PlayerCountState state) {
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

    final isRefreshing =
        state is PlayerCountRefreshing || (state is PlayerCountLoaded && state.isRefreshing);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state is PlayerCountError && state.lastKnownCount != null)
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

  Future<void> _showShareDialog(BuildContext context, PlayerCountState state) async {
    final playerCount = state.maybeWhen(
      loaded: (count, _, __, ___, ____, _____) => count.totalPlayers,
      refreshing: (count, _, __, ___) => count.totalPlayers,
      orElse: () => 0,
    );

    if (playerCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wait for data to load before sharing!')),
      );
      return;
    }

    final game = context.read<GameSelectorCubit>().state;
    // Simple heuristic for peak time label
    final now = DateTime.now().toUtc().hour;
    // Logic from PeakTimeCalculator: High activity 13-21 UTC
    // We can just calculate the next peak.
    // Simplifying for display: "16:00 UTC" or "NOW"
    String peakTime = '16:00 UTC';
    if (now >= 13 && now <= 21) peakTime = 'RIGHT NOW';

    final globalKey = GlobalKey();

    await showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(
                key: globalKey,
                child: ShareableStatCard(
                  game: game,
                  playerCount: playerCount,
                  peakTime: peakTime,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => _captureAndShare(context, globalKey, game.shortName),
                icon: const Icon(Icons.share),
                label: const Text('SHARE SNAPSHOT'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _captureAndShare(BuildContext context, GlobalKey key, String gameName) async {
    try {
      final boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return;

      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        final pngBytes = byteData.buffer.asUint8List();

        // Create an XFile from bytes
        final file = XFile.fromData(pngBytes, mimeType: 'image/png', name: '${gameName}_stats.png');

        // Close dialog first
        if (context.mounted) Navigator.pop(context);

        await Share.shareXFiles(
          [file],
          text: 'Check out the live player stats for $gameName! #ArcRaiders #Battlefield',
        );
      }
    } catch (e) {
      debugPrint('Error sharing: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to share: $e')),
        );
      }
    }
  }
}
