import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Synthwave glow effect for primary elements
class SynthwaveGlow extends StatefulWidget {
  const SynthwaveGlow({
    required this.child,
    super.key,
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
