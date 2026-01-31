import 'package:arc_raiders_tracker/features/player_count/presentation/widgets/painters/scan_line_painter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                painter: ScanLinePainter(
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
