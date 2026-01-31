import 'dart:math' as math;
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/painters/arc_ring_painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Arc Raiders style animated loading indicator
class ArcLoadingIndicator extends StatefulWidget {
  const ArcLoadingIndicator({
    super.key,
    this.size = 60,
    this.message = 'LOADING',
  });

  final double size;
  final String message;

  @override
  State<ArcLoadingIndicator> createState() => _ArcLoadingIndicatorState();
}

class _ArcLoadingIndicatorState extends State<ArcLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: CustomPaint(
                size: Size(widget.size, widget.size),
                painter: ArcRingPainter(progress: _controller.value),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                AppColors.accentCyan,
                AppColors.accentYellow,
                AppColors.accentOrange,
                AppColors.primary,
              ],
            ).createShader(bounds);
          },
          child: Text(
            widget.message,
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
        ),
      ],
    );
  }
}
