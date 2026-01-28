import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/services/ping_estimator.dart';
import 'package:flutter/material.dart';

/// Card displaying ping estimates to different server regions
/// Shows numerical ping values (ms) with color coding based on quality
class PingEstimatorCard extends StatefulWidget {
  const PingEstimatorCard({super.key});

  @override
  State<PingEstimatorCard> createState() => _PingEstimatorCardState();
}

class _PingEstimatorCardState extends State<PingEstimatorCard> {
  final PingEstimator _pingEstimator = PingEstimator();
  late List<RegionPing> _regionPings;

  @override
  void initState() {
    super.initState();
    _refreshPings();
  }

  void _refreshPings() {
    setState(() {
      _regionPings = _pingEstimator.getRegionPingsSorted();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colors.surfaceHighlight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.speed,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'PING ESTIMATOR',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
              ),
              const Spacer(),
              IconButton(
                onPressed: _refreshPings,
                icon: const Icon(Icons.refresh, size: 20),
                tooltip: 'Refresh ping estimates',
                color: colors.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Estimated latency to server regions',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colors.textSecondary,
                ),
          ),
          const SizedBox(height: 20),
          ...List.generate(_regionPings.length, (index) {
            final ping = _regionPings[index];
            return _PingRow(
              regionPing: ping,
              isFirst: index == 0,
            );
          }),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.textPrimary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 16,
                  color: colors.textTertiary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Ping values are estimates. Actual latency may vary based on your location and network.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colors.textTertiary,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PingRow extends StatelessWidget {
  const _PingRow({
    required this.regionPing,
    required this.isFirst,
    required this.isDark,
  });

  final RegionPing regionPing;
  final bool isFirst;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final pingColor = _getColorForQuality(regionPing.quality);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          // Region icon
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: _getRegionColor(regionPing.region).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                _getRegionEmoji(regionPing.region),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Region name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      regionPing.regionName,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.textPrimary : AppColors.textPrimaryLight,
                          ),
                    ),
                    if (isFirst) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.online.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'BEST',
                          style: TextStyle(
                            color: AppColors.online,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  _getQualityLabel(regionPing.quality),
                  style: TextStyle(
                    color: pingColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Ping value
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: pingColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: pingColor.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ping indicator bar
                Container(
                  width: 4,
                  height: 16,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: pingColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Text(
                  '${regionPing.pingMs}',
                  style: TextStyle(
                    color: pingColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  'ms',
                  style: TextStyle(
                    color: pingColor.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorForQuality(PingQuality quality) {
    return switch (quality) {
      PingQuality.excellent => AppColors.online,
      PingQuality.good => const Color(0xFF7CB342), // Light green
      PingQuality.fair => AppColors.warning,
      PingQuality.poor => const Color(0xFFFF7043), // Deep orange
      PingQuality.bad => AppColors.error,
    };
  }

  Color _getRegionColor(Region region) {
    return switch (region) {
      Region.europe => AppColors.europe,
      Region.northAmerica => AppColors.northAmerica,
      Region.asia => AppColors.asia,
      Region.southAmerica => AppColors.southAmerica,
      Region.oceania => AppColors.oceania,
    };
  }

  String _getRegionEmoji(Region region) {
    return switch (region) {
      Region.europe => '🇪🇺',
      Region.northAmerica => '🇺🇸',
      Region.asia => '🌏',
      Region.southAmerica => '🌎',
      Region.oceania => '🇦🇺',
    };
  }

  String _getQualityLabel(PingQuality quality) {
    return switch (quality) {
      PingQuality.excellent => 'Excellent',
      PingQuality.good => 'Good',
      PingQuality.fair => 'Fair',
      PingQuality.poor => 'Poor',
      PingQuality.bad => 'High Latency',
    };
  }
}
