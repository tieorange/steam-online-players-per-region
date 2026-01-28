import 'dart:ui' as ui;
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/player_count.dart';
import 'package:flutter/material.dart';

class PlayerCountCard extends StatelessWidget {
  const PlayerCountCard({
    required this.count,
    super.key,
    this.isSteam = true,
  });
  final PlayerCount count;
  final bool isSteam;

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.surfaceHighlight),
                  ),
                  child: Text(
                    isSteam ? 'STEAM PLAYERS (LIVE)' : 'TOTAL ESTIMATE',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.textSecondary,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 32),
                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: count.totalPlayers),
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOutExpo,
                  builder: (context, value, child) {
                    return ShaderMask(
                      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                      child: Text(
                        _formatNumber(value),
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white, // Required for ShaderMask
                          fontSize: 88,
                          shadows: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.4),
                              blurRadius: 40,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  'CURRENTLY ONLINE',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary.withValues(alpha: 0.8),
                        letterSpacing: 4,
                      ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.surfaceHighlight),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        size: 14,
                        color: AppColors.textTertiary.withValues(alpha: 0.8),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'UPDATED ${_formatTime(count.timestamp)}',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.textTertiary,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                      ),
                    ],
                  ),
                ),
                if (count.source == PlayerCountSource.cached) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      'OFFLINE MODE',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: AppColors.warning,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    // Simple formatter, can use NumberFormat from intl package
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  String _formatTime(DateTime time) {
    return "${time.toLocal().hour}:${time.toLocal().minute.toString().padLeft(2, '0')}:${time.toLocal().second.toString().padLeft(2, '0')}";
  }
}
