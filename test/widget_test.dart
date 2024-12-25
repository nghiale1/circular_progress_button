import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:circular_progress_button/circular_progress_button.dart';

void main() {
  group('CircularProgressButton Tests', () {
    testWidgets('Initial state with default values test',
            (WidgetTester tester) async {
          bool tapCalled = false;

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: CircularProgressButton(
                  totalSteps: 3,
                  onTap: () => tapCalled = true,
                ),
              ),
            ),
          );

          // Verify initial state
          final buttonFinder = find.byType(CircularProgressButton);
          expect(buttonFinder, findsOneWidget);

          // Test default theme values
          final CircularProgressButton button = tester.widget(buttonFinder);
          expect(button.totalSteps, equals(3));
          expect(button.currentStep, isNull);
          expect(button.theme.size, equals(60.0));
          expect(button.theme.strokeWidth, equals(8.0));
          expect(button.theme.progressColor, equals(Colors.blue));
        });

    testWidgets('Initial state with currentStep test',
            (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: CircularProgressButton(
                  totalSteps: 5,
                  currentStep: 2,
                  onTap: () {},
                ),
              ),
            ),
          );

          final CircularProgressButton button =
          tester.widget(find.byType(CircularProgressButton));
          expect(button.totalSteps, equals(5));
          expect(button.currentStep, equals(2));

          // Let the initial animation complete
          await tester.pump();
          await tester.pump(const Duration(seconds: 2));
        });

    testWidgets('Progress step calculation test', (WidgetTester tester) async {
      bool tapCalled = false;
      bool completeCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircularProgressButton(
              totalSteps: 4,
              onTap: () => tapCalled = true,
              onComplete: () => completeCalled = true,
            ),
          ),
        ),
      );

      // First tap
      await tester.tap(find.byType(CircularProgressButton));
      await tester.pump();
      expect(tapCalled, isTrue);

      // Wait for animation
      await tester.pump(const Duration(seconds: 2));

      // Second tap
      tapCalled = false;
      await tester.tap(find.byType(CircularProgressButton));
      await tester.pump();
      expect(tapCalled, isTrue);

      // Wait for animation
      await tester.pump(const Duration(seconds: 2));

      // Third tap
      tapCalled = false;
      await tester.tap(find.byType(CircularProgressButton));
      await tester.pump();
      expect(tapCalled, isTrue);

      // Wait for animation
      await tester.pump(const Duration(seconds: 2));

      // Fourth (final) tap
      tapCalled = false;
      await tester.tap(find.byType(CircularProgressButton));
      await tester.pump();
      expect(tapCalled, isTrue);

      // Wait for final animation
      await tester.pump(const Duration(seconds: 2));
      expect(completeCalled, isTrue);

      // Extra tap should still trigger onTap but not change progress
      tapCalled = false;
      await tester.tap(find.byType(CircularProgressButton));
      await tester.pump();
      expect(tapCalled, isTrue);
    });

    testWidgets('Invalid total steps test', (WidgetTester tester) async {
      expect(
            () => CircularProgressButton(
          totalSteps: 0,
          onTap: () {},
        ),
        throwsAssertionError,
      );

      expect(
            () => CircularProgressButton(
          totalSteps: -1,
          onTap: () {},
        ),
        throwsAssertionError,
      );
    });

    testWidgets('Invalid current step test', (WidgetTester tester) async {
      expect(
            () => CircularProgressButton(
          totalSteps: 3,
          currentStep: -1,
          onTap: () {},
        ),
        throwsAssertionError,
      );

      expect(
            () => CircularProgressButton(
          totalSteps: 3,
          currentStep: 3,
          onTap: () {},
        ),
        throwsAssertionError,
      );
    });

    testWidgets('Update widget test', (WidgetTester tester) async {
      final ValueNotifier<int> totalSteps = ValueNotifier<int>(3);
      final ValueNotifier<int?> currentStep = ValueNotifier<int?>(null);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ValueListenableBuilder<int>(
              valueListenable: totalSteps,
              builder: (context, total, _) {
                return ValueListenableBuilder<int?>(
                  valueListenable: currentStep,
                  builder: (context, current, _) {
                    return CircularProgressButton(
                      totalSteps: total,
                      currentStep: current,
                      onTap: () {},
                    );
                  },
                );
              },
            ),
          ),
        ),
      );

      // Initial state
      CircularProgressButton button =
      tester.widget(find.byType(CircularProgressButton));
      expect(button.totalSteps, equals(3));
      expect(button.currentStep, isNull);

      // Update total steps
      totalSteps.value = 5;
      await tester.pump();
      button = tester.widget(find.byType(CircularProgressButton));
      expect(button.totalSteps, equals(5));

      // Update current step
      currentStep.value = 2;
      await tester.pump();
      button = tester.widget(find.byType(CircularProgressButton));
      expect(button.currentStep, equals(2));
    });

    testWidgets('Custom theme test', (WidgetTester tester) async {
      const customTheme = ProgressButtonTheme(
        progressColor: Colors.red,
        backgroundColor: Colors.grey,
        strokeWidth: 10.0,
        size: 80.0,
        icon: Icons.check,
        iconSize: 50.0,
        iconColor: Colors.white,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircularProgressButton(
              totalSteps: 3,
              theme: customTheme,
              onTap: () {},
            ),
          ),
        ),
      );

      final CircularProgressButton button =
      tester.widget(find.byType(CircularProgressButton));

      expect(button.theme.progressColor, equals(Colors.red));
      expect(button.theme.backgroundColor, equals(Colors.grey));
      expect(button.theme.strokeWidth, equals(10.0));
      expect(button.theme.size, equals(80.0));
      expect(button.theme.icon, equals(Icons.check));
      expect(button.theme.iconSize, equals(50.0));
      expect(button.theme.iconColor, equals(Colors.white));
    });

    testWidgets('Animation duration test', (WidgetTester tester) async {
      const customDuration = Duration(milliseconds: 1500);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CircularProgressButton(
              totalSteps: 3,
              animationDuration: customDuration,
              onTap: () {},
            ),
          ),
        ),
      );

      final CircularProgressButton button =
      tester.widget(find.byType(CircularProgressButton));
      expect(button.animationDuration, equals(customDuration));
    });
  });
}