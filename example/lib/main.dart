import 'package:flutter/material.dart';
import 'package:circular_progress_button/circular_progress_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Progress Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Progress Button Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Default theme
            CircularProgressButton(
              onTap: () => print('Tapped!'),
              onComplete: () => print('Completed!'),
              totalSteps: 5,
              currentStep: 1,
            ),

            const SizedBox(height: 32),

            // Custom theme
            CircularProgressButton(
              theme: ProgressButtonTheme(
                progressColor: Colors.green,
                backgroundColor: Colors.green.withOpacity(0.3),
                strokeWidth: 10,
                size: 80,
                iconSize: 50,
                icon: Icons.check,
              ),
              onTap: () => print('Custom button tapped!'),
              animationDuration: const Duration(milliseconds: 1000),
              totalSteps: 7,
              currentStep: 2,
            ),

            // Custom theme
            CircularProgressButton(
              theme: ProgressButtonTheme(
                progressColor: Colors.redAccent,
                backgroundColor: Colors.redAccent.withOpacity(0.3),
                strokeWidth: 10,
                size: 80,
                iconSize: 50,
                icon: Icons.check,
              ),
              onTap: () => print('Custom button tapped!'),
              animationDuration: const Duration(milliseconds: 1000),
              totalSteps: 5,
              currentStep: 0,
            ),
          ],
        ),
      ),
    );
  }
}