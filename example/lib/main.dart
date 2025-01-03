import 'package:flutter/material.dart';
import 'package:circular_progress_button/circular_progress_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 1;
  int totalSteps = 3;

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
            const SizedBox(height: 32),
            // Custom theme
            CircularProgressButton(
              theme: ProgressButtonTheme(
                progressColor: Colors.redAccent,
                backgroundColor: Colors.redAccent.withOpacity(0.3),
                strokeWidth: 10,
                size: 80,
                iconSize: 50,
                icon: Icons.navigate_next,
                // iconWidget: Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: SvgPicture.asset('assets/next.svg', width: 35, height: 35, color: Colors.white,),
                // ),
              ),
              onTap: () {
                if (currentStep == totalSteps) {
                  print("Completed");
                }
              },
              onComplete: () => print('Completed!'),
              animationDuration: const Duration(milliseconds: 1000),
              totalSteps: totalSteps,
              currentStep: currentStep,
            ),
          ],
        ),
      ),
    );
  }
}
