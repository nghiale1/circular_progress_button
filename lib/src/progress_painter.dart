import 'dart:math';
import 'package:flutter/material.dart';
import 'progress_theme.dart';

/// CustomPainter for drawing the circular progress
class ProgressCirclePainter extends CustomPainter {
  final double progress;
  final ProgressButtonTheme theme;

  ProgressCirclePainter({
    required this.progress,
    required this.theme,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = theme.backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = theme.strokeWidth;

    final Paint progressPaint = Paint()
      ..color = theme.progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = theme.strokeWidth;

    // Draw the background circle
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, backgroundPaint);

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -pi / 2, // Start from top (12 o'clock position)
      2 * pi * progress, // Sweep based on current progress
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ProgressCirclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}