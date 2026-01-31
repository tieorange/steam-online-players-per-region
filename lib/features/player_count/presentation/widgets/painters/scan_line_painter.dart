import 'package:flutter/material.dart';

/// Scan-line painter for CRT effect
class ScanLinePainter extends CustomPainter {
  ScanLinePainter({required this.lineOpacity});

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
