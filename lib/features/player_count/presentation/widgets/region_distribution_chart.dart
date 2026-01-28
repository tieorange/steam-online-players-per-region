import 'dart:ui' as ui;
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/core/utils/region_estimator.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:flutter/material.dart';
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
    final sortedEntries = distribution.distribution.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Calculate max value for relative bar width
    final maxVal = sortedEntries.isEmpty ? 1 : sortedEntries.first.value;

    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.glassGradient,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.surfaceHighlight.withValues(alpha: 0.5)),
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
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.public, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'REGIONAL ESTIMATES',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.textTertiary,
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
                                hoverColor: AppColors.primary.withValues(alpha: 0.05),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primary.withValues(alpha: 0.1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isSelected
                                        ? Border.all(
                                            color: AppColors.primary.withValues(alpha: 0.3),
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
                                                _getRegionFlag(region),
                                                style: const TextStyle(fontSize: 24),
                                              ),
                                              const SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _getRegionName(region),
                                                    style: TextStyle(
                                                      color: isSelected
                                                          ? AppColors.primary
                                                          : AppColors.textPrimary,
                                                      fontWeight: isSelected
                                                          ? FontWeight.bold
                                                          : FontWeight.w600,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    _getRegionTime(region),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                          color: AppColors.textTertiary,
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
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? AppColors.primary
                                                      : AppColors.textPrimary,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'RobotoMono', // Monospace for numbers
                                                ),
                                              ),
                                              Text(
                                                '${totalPercentage.toStringAsFixed(1)}%',
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? AppColors.primary.withValues(alpha: 0.7)
                                                      : AppColors.textTertiary,
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
                                                      _getRegionColor(region)
                                                          .withValues(alpha: 0.7),
                                                      _getRegionColor(region),
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.circular(3),
                                                  boxShadow: isSelected
                                                      ? [
                                                          BoxShadow(
                                                            color: _getRegionColor(region)
                                                                .withValues(alpha: 0.4),
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

  String _getRegionName(Region region) {
    switch (region) {
      case Region.europe:
        return 'Europe';
      case Region.northAmerica:
        return 'North America';
      case Region.asia:
        return 'Asia';
      case Region.southAmerica:
        return 'South America';
      case Region.oceania:
        return 'Oceania';
    }
  }

  String _getRegionFlag(Region region) {
    switch (region) {
      case Region.europe:
        return '🇪🇺';
      case Region.northAmerica:
        return '🇺🇸'; // Using US flag for NA
      case Region.asia:
        return '🌏';
      case Region.southAmerica:
        return '🇧🇷';
      case Region.oceania:
        return '🇦🇺';
    }
  }

  Color _getRegionColor(Region region) {
    switch (region) {
      case Region.europe:
        return AppColors.europe;
      case Region.northAmerica:
        return AppColors.northAmerica;
      case Region.asia:
        return AppColors.asia;
      case Region.southAmerica:
        return AppColors.southAmerica;
      case Region.oceania:
        return AppColors.oceania;
    }
  }

  String _getRegionTime(Region region) {
    final now = DateTime.now().toUtc();
    final offset = RegionEstimator.regionUtcOffsets[region] ?? 0;
    final regionTime = now.add(Duration(hours: offset));
    return DateFormat('HH:mm').format(regionTime);
  }
}
