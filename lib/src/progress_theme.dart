import 'package:flutter/material.dart';

/// Configuration for the CircularProgressButton appearance
class ProgressButtonTheme {
  /// The color of the progress arc
  final Color progressColor;

  /// The color of the background circle
  final Color backgroundColor;

  /// The width of the progress stroke
  final double strokeWidth;

  /// The size of the button
  final double size;

  /// The icon shown in the button
  final IconData icon;

  /// The size of the icon
  final double iconSize;

  /// The color of the icon
  final Color iconColor;

  const ProgressButtonTheme({
    this.progressColor = Colors.blue,
    this.backgroundColor = Colors.black12,
    this.strokeWidth = 8.0,
    this.size = 60.0,
    this.icon = Icons.arrow_forward,
    this.iconSize = 40.0,
    this.iconColor = Colors.white,
  });

  /// Creates a copy of this theme with the given fields replaced with new values
  ProgressButtonTheme copyWith({
    Color? progressColor,
    Color? backgroundColor,
    double? strokeWidth,
    double? size,
    IconData? icon,
    double? iconSize,
    Color? iconColor,
  }) {
    return ProgressButtonTheme(
      progressColor: progressColor ?? this.progressColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      icon: icon ?? this.icon,
      iconSize: iconSize ?? this.iconSize,
      iconColor: iconColor ?? this.iconColor,
    );
  }
}