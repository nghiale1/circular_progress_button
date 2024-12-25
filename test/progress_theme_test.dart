import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circular_progress_button/circular_progress_button.dart';

void main() {
  group('ProgressButtonTheme Tests', () {
    test('Default values test', () {
      const theme = ProgressButtonTheme();

      expect(theme.progressColor, equals(Colors.blue));
      expect(theme.backgroundColor, equals(Colors.black12));
      expect(theme.strokeWidth, equals(8.0));
      expect(theme.size, equals(60.0));
      expect(theme.icon, equals(Icons.arrow_forward));
      expect(theme.iconSize, equals(40.0));
      expect(theme.iconColor, equals(Colors.white));
    });

    test('copyWith test', () {
      const originalTheme = ProgressButtonTheme(
        progressColor: Colors.red,
        backgroundColor: Colors.grey,
        strokeWidth: 10.0,
        size: 80.0,
        icon: Icons.check,
        iconSize: 50.0,
        iconColor: Colors.black,
      );

      final copiedTheme = originalTheme.copyWith(
        progressColor: Colors.blue,
        size: 70.0,
      );

      // Changed values
      expect(copiedTheme.progressColor, equals(Colors.blue));
      expect(copiedTheme.size, equals(70.0));

      // Unchanged values
      expect(copiedTheme.backgroundColor, equals(Colors.grey));
      expect(copiedTheme.strokeWidth, equals(10.0));
      expect(copiedTheme.icon, equals(Icons.check));
      expect(copiedTheme.iconSize, equals(50.0));
      expect(copiedTheme.iconColor, equals(Colors.black));
    });
  });
}