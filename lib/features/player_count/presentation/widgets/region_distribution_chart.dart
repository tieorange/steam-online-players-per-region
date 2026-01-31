import 'dart:ui' as ui;
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/core/utils/region_utils.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RegionDistributionChart extends StatelessWidget {
  const RegionDistributionChart({
    required this.distribution,
    required this.onRegionSelected,
    super.key,
    this.selectedRegion,
  });
  final RegionalDistribution distribution;
  final Region? selectedRegion;
  final void Function(Region) onRegionSelected;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    final sortedEntries = distribution.distribution.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Calculate max value for relative bar width
    final maxVal = sortedEntries.isEmpty ? 1 : sortedEntries.first.value;

    return Container(
      decoration: BoxDecoration(
        gradient: colors.glassGradient,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: colors.surfaceHighlight.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.public, color: colors.primary, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'REGIONAL ESTIMATES',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: colors.textTertiary,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ...sortedEntries.asMap().entries.map((entry) {
                  final index = entry.key;
                  final region = entry.value.key;
                  final count = entry.value.value;
                  final isSelected = region == selectedRegion;
                  final percentage = (count / maxVal).clamp(0, 1);
                  final totalPercentage =
                      (count / distribution.distribution.values.reduce((a, b) => a + b)) * 100;

                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 600 + (index * 100)),
                    curve: Curves.easeOutQuart,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 20 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => onRegionSelected(region),
                                borderRadius: BorderRadius.circular(12),
                                hoverColor: colors.primary.withValues(alpha: 0.05),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? colors.primary.withValues(alpha: 0.1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isSelected
                                        ? Border.all(
                                            color: colors.primary.withValues(alpha: 0.3),
                                          )
                                        : Border.all(color: Colors.transparent),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                region.flag,
                                                style: const TextStyle(fontSize: 24),
                                              ),
                                              const SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    region.displayName,
                                                    style: GoogleFonts.barlow(
                                                      color: isSelected
                                                          ? colors.primary
                                                          : colors.textPrimary,
                                                      fontWeight: isSelected
                                                          ? FontWeight.bold
                                                          : FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    DateFormat('HH:mm').format(region.currentTime),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: colors.textTertiary,
                                                          fontSize: 12,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                _formatNumber(count),
                                                style: GoogleFonts.jetBrainsMono(
                                                  color: isSelected
                                                      ? colors.primary
                                                      : colors.textPrimary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '${totalPercentage.toStringAsFixed(1)}%',
                                                style: GoogleFonts.jetBrainsMono(
                                                  color: isSelected
                                                      ? colors.primary.withValues(alpha: 0.7)
                                                      : colors.textTertiary,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      LayoutBuilder(
                                        builder: (context, constraints) {
                                          return Stack(
                                            children: [
                                              Container(
                                                height: 6,
                                                width: constraints.maxWidth,
                                                decoration: BoxDecoration(
                                                  color: AppColors.surfaceHighlight
                                                      .withValues(alpha: 0.3),
                                                  borderRadius: BorderRadius.circular(3),
                                                ),
                                              ),
                                              AnimatedContainer(
                                                duration: const Duration(seconds: 1),
                                                curve: Curves.easeOutQuart,
                                                height: 6,
                                                width: constraints.maxWidth *
                                                    percentage *
                                                    value, // Animate width with entrance
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      region.color.withValues(alpha: 0.7),
                                                      region.color,
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.circular(3),
                                                  boxShadow: isSelected
                                                      ? [
                                                          BoxShadow(
                                                            color:
                                                                region.color.withValues(alpha: 0.4),
                                                            blurRadius: 8,
                                                          ),
                                                        ]
                                                      : null,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.surfaceHighlight.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: AppColors.textTertiary.withValues(alpha: 0.8),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Estimates based on recent match history and timezone activity segments.',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textTertiary,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }
}
