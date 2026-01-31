import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/playstyle.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/server_recommendation.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/services/server_recommendation_service.dart';
import 'package:arc_raiders_tracker/core/utils/region_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        final colors = ThemeColors.of(context);

        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 24,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(2),
                              boxShadow: [
                                BoxShadow(
                                  color: colors.primary.withValues(alpha: 0.5),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'WHERE TO PLAY NOW',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    if (isNarrow) ...[
                      _RecommendationCard(recommendation: pvpRec, delay: 200),
                      const SizedBox(height: 16),
                      _RecommendationCard(recommendation: pveRec, delay: 400),
                    ] else
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _RecommendationCard(recommendation: pvpRec, delay: 200)),
                          const SizedBox(width: 24),
                          Expanded(child: _RecommendationCard(recommendation: pveRec, delay: 400)),
                        ],
                      ),
                    const SizedBox(height: 24),
                    Text(
                      'Recommendations heavily weighted by active player count & regional playstyle culture.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colors.textTertiary,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.recommendation, this.delay = 0});

  final ServerRecommendation recommendation;
  final int delay;

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColors.of(context);
    final isPvp = recommendation.playstyle == Playstyle.pvp;
    final color = isPvp ? colors.error : colors.online;
    final safeIcon = isPvp ? Icons.flash_on : Icons.shield;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (0.1 * value),
          child: Opacity(opacity: value.clamp(0.0, 1.0), child: child),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: color.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.05),
              blurRadius: 20,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {}, // Add interaction
              hoverColor: color.withValues(alpha: 0.05),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                            border: Border.all(color: color.withValues(alpha: 0.2)),
                          ),
                          child: Icon(safeIcon, color: color, size: 24),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            isPvp ? 'PVP ACTION' : 'PVE FARMING',
                            style: GoogleFonts.barlow(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      recommendation.recommendedRegion.displayName,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.people_outline, size: 18, color: colors.textSecondary),
                        const SizedBox(width: 8),
                        Text(
                          '~${recommendation.estimatedPlayers} Active Players',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: colors.textSecondary,
                                fontSize: 16,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colors.surfaceHighlight.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: colors.textSecondary.withValues(alpha: 0.8),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              recommendation.reason,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colors.textSecondary,
                                    height: 1.4,
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
        ),
      ),
    );
  }
}
