import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_bloc.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_event.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/player_count_state.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/best_server_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/error_view.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/live_indicator.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/player_count_card.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/region_distribution_chart.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/shimmer_loading.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/user_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Stack(
            children: [
              // Background Elements (Grid/Particles/Image)
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.topCenter,
                      radius: 1.5,
                      colors: [
                        AppColors.background,
                        Colors.black,
                      ],
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
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.rocket_launch, color: AppColors.primary),
                        const SizedBox(width: 12),
                        Text('ARC RAIDERS', style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(width: 8),
                        Container(width: 1, height: 20, color: AppColors.textTertiary),
                        const SizedBox(width: 8),
                        const Text('TRACKER', style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                    actions: const [
                      Center(child: LiveIndicator()),
                      SizedBox(width: 20),
                    ],
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
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Regional data is estimated based on timezone activity patterns.',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: AppColors.textTertiary),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_off, size: 18, color: AppColors.error),
                    SizedBox(width: 8),
                    Text(
                      'Connection lost. Showing cached data.',
                      style: TextStyle(color: AppColors.error, fontWeight: FontWeight.bold),
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
        BestServerCard(distribution: distribution),
      ],
    );
  }
}
