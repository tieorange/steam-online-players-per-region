import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/services/peak_time_calculator.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/bloc/game_selector_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HourlyHeatmapWidget extends StatelessWidget {
  const HourlyHeatmapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine title based on Game
    final gameTitle = context.read<GameSelectorCubit>().state.shortName;

    // We can inject the service or just instantiate it since it's pure logic
    // For proper DI, we should use getIt, but assuming it's available via context logic if we had a Bloc.
    // Since it's a simple service, we'll instantiate for now or use a RepositoryProvider if we set one up.
    // Let's just instantiate to keep it simple as it has no dependencies.
    final calculator = PeakTimeCalculator();
    final forecast = calculator.getForecastForNext24Hours();

    final colors = ThemeColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.access_time_filled, color: colors.primary, size: 16),
              const SizedBox(width: 8),
              Text(
                'BEST TIMES TO PLAY (24H FORECAST)',
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
        SizedBox(
          height: 130,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: forecast.length,
            separatorBuilder: (_, __) => const SizedBox(width: 4),
            itemBuilder: (context, index) {
              final item = forecast[index];
              return _TimeBlock(item: item, isPeak: item.activityScore > 0.8);
            },
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Based on global player activity patterns for $gameTitle',
            style: GoogleFonts.barlow(
              color: colors.textTertiary,
              fontSize: 10,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeBlock extends StatelessWidget {
  const _TimeBlock({required this.item, required this.isPeak});

  final HourlyForecast item;
  final bool isPeak;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    final timeStr = DateFormat('HH:mm').format(item.time.toLocal()); // Show local time to user

    // Color interpolation
    // Low (0.2) -> Blue/Grey
    // High (1.0) -> Primary/Red
    Color blockColor = Color.lerp(
      colors.surface,
      colors.primary,
      item.activityScore,
    )!;

    if (item.activityScore < 0.4) {
      blockColor = colors.surface.withOpacity(0.5);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isPeak)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Icon(Icons.star, size: 10, color: colors.primary),
          ),
        Container(
          width: 24,
          height: 40 + (40 * item.activityScore), // Bar chart effect
          decoration: BoxDecoration(
            color: blockColor,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          timeStr,
          style: GoogleFonts.barlow(
            color: colors.textSecondary,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
