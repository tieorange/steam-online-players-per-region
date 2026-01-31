import 'dart:math' as math;
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Arc ring painter for loading indicator
class ArcRingPainter extends CustomPainter {
  ArcRingPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Background ring
    final bgPaint = Paint()
      ..color = AppColors.surfaceHighlight
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, bgPaint);

    // Synthwave gradient arc
    final gradientPaint = Paint()
      ..shader = const SweepGradient(
        startAngle: 0,
        endAngle: math.pi * 2,
        colors: [
          AppColors.accentCyan,
          AppColors.accentYellow,
          AppColors.accentOrange,
          AppColors.primary,
          AppColors.accentCyan,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 1.5,
      false,
      gradientPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ArcRingPainter oldDelegate) => oldDelegate.progress != progress;
}
