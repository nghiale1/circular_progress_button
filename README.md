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
  circular_progress_button: ^0.0.4
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

## Support
If you find this project helpful, you can support me:

<a href="https://buymeacoffee.com/nghiale1" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>