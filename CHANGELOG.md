## 0.0.5

- Bug last onTap

## 0.0.4

- Bug Fixes:
  - Removed redundant null checks for non-nullable currentStep parameter
- Features:
  - Added iconWidget support to allow SVG icons
  - Made icon parameter optional when iconWidget is provided
  - Updated theme configuration to handle both IconData and Widget icons
- Breaking Changes:
  - ProgressButtonTheme constructor now requires either icon or iconWidget

- ## 0.0.3

- Fixed bug where currentStep did not initialize the start animation.
- Resolved issue where currentStep was incorrectly equal to totalStep.

## 0.0.2

- Update pubspec

## 0.0.1

- Initial release