import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circular_progress_button/circular_progress_button.dart';

void main() {
  test('ProgressCirclePainter shouldRepaint test', () {
    const theme = ProgressButtonTheme();

    final painter1 = ProgressCirclePainter(
      progress: 0.5,
      theme: theme,
    );

    final painter2 = ProgressCirclePainter(
      progress: 0.5,
      theme: theme,
    );

    final painter3 = ProgressCirclePainter(
      progress: 0.7,
      theme: theme,
    );

    expect(painter1.shouldRepaint(painter2), isFalse);
    expect(painter1.shouldRepaint(painter3), isTrue);
  });
}