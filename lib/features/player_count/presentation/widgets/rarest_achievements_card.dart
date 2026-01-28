import 'package:arc_raiders_tracker/core/entities/game.dart';
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/achievement_stat.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/achievements/achievements_cubit.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/achievements/achievements_state.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/game_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RarestAchievementsCard extends StatelessWidget {
  const RarestAchievementsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = context.read<AchievementsCubit>();
        final appId = context.read<GameSelectorCubit>().state.appId;
        cubit.loadAchievements(appId);
        return cubit;
      },
      child: BlocListener<GameSelectorCubit, Game>(
        listener: (context, state) {
          context.read<AchievementsCubit>().loadAchievements(state.appId);
        },
        child: BlocBuilder<AchievementsCubit, AchievementsState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (achievements) => _buildContent(context, achievements),
              loading: () => const Center(
                  child: Padding(
                padding: EdgeInsets.all(24.0),
                child: CircularProgressIndicator(),
              )),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<AchievementStat> achievements) {
    if (achievements.isEmpty) return const SizedBox.shrink();

    final colors = ThemeColors.of(context);
    // Take top 3 rarest
    final topRarest = achievements.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.emoji_events, color: colors.primary, size: 16),
              const SizedBox(width: 8),
              Text(
                'RAREST ACHIEVEMENTS',
                style: GoogleFonts.barlow(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: colors.textTertiary.withOpacity(0.1)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: topRarest.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isLast = index == topRarest.length - 1;

              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colors.background,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                index == 0 ? colors.primary : colors.textTertiary.withOpacity(0.3),
                            width: index == 0 ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '#${index + 1}',
                            style: GoogleFonts.barlow(
                              color: index == 0 ? colors.primary : colors.textSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.displayName,
                              style: GoogleFonts.barlow(
                                color: colors.textPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Unlocked by only ${item.percent.toStringAsFixed(1)}% of players',
                              style: GoogleFonts.barlow(
                                color: colors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '${item.percent.toStringAsFixed(1)}%',
                        style: GoogleFonts.orbitron(
                          color: index == 0 ? colors.primary : colors.textTertiary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  if (!isLast)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Divider(color: colors.textTertiary.withOpacity(0.1), height: 1),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
