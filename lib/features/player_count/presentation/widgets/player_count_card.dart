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
    return Card(
      elevation: 8,
      shadowColor: AppColors.primary.withValues(alpha: 0.2),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              isSteam ? 'STEAM PLAYERS' : 'TOTAL ESTIMATE',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.textTertiary,
                    letterSpacing: 2,
                  ),
            ),
            const SizedBox(height: 16),
            TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: count.totalPlayers),
              duration: const Duration(seconds: 2),
              curve: Curves.easeOutExpo,
              builder: (context, value, child) {
                return Text(
                  _formatNumber(value),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primary,
                    shadows: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surfaceLight,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.surfaceHighlight),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.access_time, size: 14, color: AppColors.textTertiary),
                  const SizedBox(width: 6),
                  Text(
                    'Updated ${_formatTime(count.timestamp)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                  ),
                ],
              ),
            ),
            if (count.source == PlayerCountSource.cached) ...[
              const SizedBox(height: 8),
              Text(
                'OFFLINE CACHE',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.warning,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ],
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
