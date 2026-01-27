import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/playstyle.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/server_recommendation.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/services/server_recommendation_service.dart';
import 'package:flutter/material.dart';

class BestServerCard extends StatelessWidget {
  const BestServerCard({
    required this.distribution,
    super.key,
  });

  final RegionalDistribution distribution;

  @override
  Widget build(BuildContext context) {
    if (distribution.distribution.values.every((v) => v == 0)) {
      return const SizedBox.shrink();
    }

    final service = ServerRecommendationService();
    final recommendations = service.getRecommendations(
      distribution: distribution,
      currentTime: DateTime.now(),
    );

    final pvpRec = recommendations.firstWhere((r) => r.playstyle == Playstyle.pvp);
    final pveRec = recommendations.firstWhere((r) => r.playstyle == Playstyle.pve);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 600;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'WHERE TO PLAY NOW',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: 1.5,
                        ),
                  ),
                ],
              ),
            ),
            if (isNarrow) ...[
              _RecommendationCard(recommendation: pvpRec),
              const SizedBox(height: 16),
              _RecommendationCard(recommendation: pveRec),
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _RecommendationCard(recommendation: pvpRec)),
                  const SizedBox(width: 24),
                  Expanded(child: _RecommendationCard(recommendation: pveRec)),
                ],
              ),
            const SizedBox(height: 12),
            Text(
              'Recommendations heavily weighted by active player count & regional playstyle culture.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textTertiary,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ],
        );
      },
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.recommendation});

  final ServerRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final isPvp = recommendation.playstyle == Playstyle.pvp;
    final color = isPvp ? AppColors.error : AppColors.online;
    final safeIcon = isPvp ? Icons.flash_on : Icons.shield;

    return Card(
      elevation: 4,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: color.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(safeIcon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  isPvp ? 'FOR PVP ACTION' : 'FOR PVE LOOTING',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _formatRegion(recommendation.recommendedRegion),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.people_outline, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 8),
                Text(
                  '~${recommendation.estimatedPlayers} Active Players',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.info_outline, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    recommendation.reason,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
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

  String _formatRegion(Region region) {
    switch (region) {
      case Region.europe:
        return 'Europe';
      case Region.northAmerica:
        return 'North America';
      case Region.southAmerica:
        return 'South America';
      case Region.asia:
        return 'Asia';
      case Region.oceania:
        return 'Oceania';
    }
  }
}
