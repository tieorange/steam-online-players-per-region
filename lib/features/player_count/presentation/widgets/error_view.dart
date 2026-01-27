import 'package:flutter/material.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/player_count.dart';

class ErrorView extends StatelessWidget {
  final Failure failure;
  final PlayerCount? lastKnownCount;
  final VoidCallback onRetry;

  const ErrorView({
    super.key,
    required this.failure,
    this.lastKnownCount,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (lastKnownCount != null) {
      // If we have stale data, show a snackbar or subtle banner instead of full screen error
      // But for this component, we might want to return a small error card
      return Container(); // Handled in HomePage usually
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 64,
            color: AppColors.error,
          ),
          const SizedBox(height: 16),
          Text(
            failure.userFriendlyMessage,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.error,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            failure.message, // Technical message for debugging
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textTertiary,
              fontFamily: 'monospace',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('RETRY'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surfaceLight,
              foregroundColor: AppColors.textPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: AppColors.surfaceHighlight),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
