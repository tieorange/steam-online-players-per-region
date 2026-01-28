import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LiveIndicator extends StatefulWidget {
  const LiveIndicator({super.key});

  @override
  State<LiveIndicator> createState() => _LiveIndicatorState();
}

class _LiveIndicatorState extends State<LiveIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CustomPaint(
            painter: RipplePainter(
              animation: _controller,
              color: AppColors.online,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'LIVE',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.online,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
        ),
      ],
    );
  }
}

class RipplePainter extends CustomPainter {
  RipplePainter({required this.animation, required this.color}) : super(repaint: animation);

  final Animation<double> animation;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width; // Allow ripples to go slightly outside

    // Draw core dot
    final paint = Paint()..color = color;
    canvas.drawCircle(center, 4, paint);

    // Draw shadow/glow for core dot
    final shadowPaint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(center, 4, shadowPaint);

    // Ripple 1
    _drawRipple(canvas, center, maxRadius, 0, 0.6);

    // Ripple 2
    _drawRipple(canvas, center, maxRadius, 0.2, 0.8);
  }

  void _drawRipple(
    Canvas canvas,
    Offset center,
    double maxRadius,
    double startInterval,
    double endInterval,
  ) {
    if (animation.value < startInterval) return;

    final progress = (animation.value - startInterval) / (endInterval - startInterval);
    if (progress < 0 || progress > 1) return;

    final radius = 4 + (maxRadius - 4) * progress; // Start from core radius
    final opacity = 1.0 - progress;

    final paint = Paint()
      ..color = color.withValues(alpha: 0.3 * opacity)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant RipplePainter oldDelegate) {
    return oldDelegate.animation != animation || oldDelegate.color != color;
  }
}
