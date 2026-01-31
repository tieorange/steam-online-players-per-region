import 'dart:math' as math;
import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// CRT monitor overlay effect for Cassette Futurism aesthetic
/// Adds scan-lines, subtle flicker, and vignette for VHS-era feel
class CrtOverlay extends StatefulWidget {
  const CrtOverlay({
    super.key,
    required this.child,
    this.enableScanLines = true,
    this.enableFlicker = !kIsWeb, // Disable flicker on web for performance
    this.enableVignette = true,
    this.scanLineOpacity = 0.04,
    this.flickerIntensity = 0.015,
  });

  final Widget child;
  final bool enableScanLines;
  final bool enableFlicker;
  final bool enableVignette;
  final double scanLineOpacity;
  final double flickerIntensity;

  @override
  State<CrtOverlay> createState() => _CrtOverlayState();
}

class _CrtOverlayState extends State<CrtOverlay> with SingleTickerProviderStateMixin {
  late AnimationController _flickerController;
  late Animation<double> _flickerAnimation;

  @override
  void initState() {
    super.initState();
    // Reduce flicker frequency to save CPU (duration 100ms -> 2000ms+)
    // Or disable if requested.
    _flickerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Slower, less CPU intensive
    )..repeat(reverse: true);

    _flickerAnimation = Tween<double>(
      begin: 1.0 - (widget.flickerIntensity * 0.5), // Reduced intensity
      end: 1.0 + (widget.flickerIntensity * 0.5),
    ).animate(CurvedAnimation(
      parent: _flickerController,
      curve: Curves.easeInOutSine, // Smoother
    ));
  }

  @override
  void dispose() {
    _flickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content with optional flicker
        widget.enableFlicker
            ? AnimatedBuilder(
                animation: _flickerAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _flickerAnimation.value.clamp(0.0, 1.0),
                    child: widget.child,
                  );
                },
              )
            : widget.child,

        // Scan-lines overlay
        if (widget.enableScanLines)
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter: _ScanLinePainter(
                  lineOpacity: widget.scanLineOpacity,
                ),
              ),
            ),
          ),

        // Vignette overlay
        if (widget.enableVignette)
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.2,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.3),
                    ],
                    stops: const [0.6, 1.0],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Scan-line painter for CRT effect
class _ScanLinePainter extends CustomPainter {
  _ScanLinePainter({required this.lineOpacity});

  final double lineOpacity;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: lineOpacity)
      ..strokeWidth = 1;

    // Draw horizontal scan-lines every 3 pixels
    for (double y = 0; y < size.height; y += 3) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Synthwave glow effect for primary elements
class SynthwaveGlow extends StatefulWidget {
  const SynthwaveGlow({
    super.key,
    required this.child,
    this.glowColor = AppColors.primary,
    this.glowIntensity = 0.5,
    this.pulseSpeed = const Duration(milliseconds: 2000),
  });

  final Widget child;
  final Color glowColor;
  final double glowIntensity;
  final Duration pulseSpeed;

  @override
  State<SynthwaveGlow> createState() => _SynthwaveGlowState();
}

class _SynthwaveGlowState extends State<SynthwaveGlow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.pulseSpeed,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(
      begin: widget.glowIntensity * 0.5,
      end: widget.glowIntensity,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: widget.glowColor.withValues(alpha: _glowAnimation.value),
                blurRadius: 20,
                spreadRadius: 2,
              ),
              BoxShadow(
                color: widget.glowColor.withValues(alpha: _glowAnimation.value * 0.5),
                blurRadius: 40,
                spreadRadius: 5,
              ),
            ],
          ),
          child: widget.child,
        );
      },
    );
  }
}

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
                painter: _ArcRingPainter(progress: _controller.value),
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

/// Arc ring painter for loading indicator
class _ArcRingPainter extends CustomPainter {
  _ArcRingPainter({required this.progress});

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
  bool shouldRepaint(covariant _ArcRingPainter oldDelegate) => oldDelegate.progress != progress;
}
