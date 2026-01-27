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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'REGIONAL ESTIMATES',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textTertiary,
                    letterSpacing: 2,
                  ),
            ),
            const SizedBox(height: 24),
            ...sortedEntries.map((entry) {
              final region = entry.key;
              final count = entry.value;
              final isSelected = region == selectedRegion;
              final percentage = (count / maxVal).clamp(0.0, 1.0);
              final totalPercentage =
                  (count / distribution.distribution.values.reduce((a, b) => a + b)) * 100;

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () => onRegionSelected(region),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.surfaceLight : null,
                      borderRadius: BorderRadius.circular(8),
                      border: isSelected
                          ? Border.all(color: AppColors.primary.withValues(alpha: 0.3))
                          : null,
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
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _getRegionName(region),
                                      style: TextStyle(
                                        color:
                                            isSelected ? AppColors.primary : AppColors.textPrimary,
                                        fontWeight:
                                            isSelected ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                    Text(
                                      _getRegionTime(region),
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: AppColors.textTertiary,
                                            fontSize: 10,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '${_formatNumber(count)} (${totalPercentage.toStringAsFixed(1)}%)',
                              style: TextStyle(
                                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Stack(
                              children: [
                                Container(
                                  height: 8,
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                    color: AppColors.surfaceHighlight,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeOutQuart,
                                  height: 8,
                                  width:
                                      constraints.maxWidth * percentage, // Relative to max region
                                  decoration: BoxDecoration(
                                    color: _getRegionColor(region),
                                    borderRadius: BorderRadius.circular(4),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: _getRegionColor(region).withValues(alpha: 0.5),
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
              );
            }),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.info_outline, size: 14, color: AppColors.textTertiary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Estimates based on timezone activity patterns and market data.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ],
            ),
          ],
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
