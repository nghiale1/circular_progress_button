# Circular Progress Button

A Flutter package providing a customizable circular progress button that fills in three steps.

![Screen_recording_20241227_142915](https://github.com/user-attachments/assets/8fc5b1f0-7909-4e6f-924e-9b3374b743f8)

## Features

- Circular progress indicator that fills in three steps (33%, 66%, 100%)
- Customizable appearance through ProgressButtonTheme
- Smooth animations with configurable duration
- Completion callback
- Highly customizable (colors, sizes, icons, etc.)

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  circular_progress_button: ^0.0.1
```

## Usage

```dart
import 'package:circular_progress_button/circular_progress_button.dart';

// Basic usage
CircularProgressButton(
  onTap: () => print('Tapped!'),
  onComplete: () => print('Completed!'),
)

// Customized button
CircularProgressButton(
  theme: const ProgressButtonTheme(
    progressColor: Colors.green,
    backgroundColor: Colors.green.withOpacity(0.2),
    strokeWidth: 10,
    size: 80,
    iconSize: 50,
    icon: Icons.check,
  ),
  onTap: () => print('Custom button tapped!'),
  animationDuration: const Duration(milliseconds: 1500),
)
```

## Additional information

For issues and feature requests, please visit the [GitHub repository](https://github.com/yourusername/circular_progress_button).

## License

MIT License - see LICENSE file for details
