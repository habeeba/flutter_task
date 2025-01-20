import 'package:flutter/material.dart';

AppColors? appColor(context) => Theme.of(context).extension<AppColors>();

// Theme colors class with both light and dark mode colors
class AppThemeColors {
  // Light Theme Colors
  static AppColors light = AppColors(
    primary: Colors.blueAccent,
    secondary: Color(0xFFCEE5FD),
    background: Colors.white,
    surface: Color(0xFFF5F5F5),
    text: Colors.black87,
    grey: Color(0xFF6A6A6A),
    error: Color(0xFFD50E0E),
    warning: Color(0xFFFFC107),
    success: Color(0xFF46B36A),
  );

  // Dark Theme Colors
  static AppColors dark = AppColors(
    primary: Colors.blueAccent,
    secondary: Color(0xFF1F2937),
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    text: Colors.white,
    grey: Color(0xFF9E9E9E),
    error: Color(0xFFEF5350),
    warning: Color(0xFFFFB74D),
    success: Color(0xFF66BB6A),
  );
}

// Immutable color class for type safety
@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color text;
  final Color grey;
  final Color error;
  final Color warning;
  final Color success;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.text,
    required this.grey,
    required this.error,
    required this.warning,
    required this.success,
  });

  // Helper method to get gradient
  LinearGradient get primaryGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          primary,
          primary.withAlpha((0.7 * 255).round()),
        ],
      );

  // Helper method to get background gradient
  LinearGradient get backgroundGradient => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            background,
            primary.withAlpha((0.1.round())),
          ],
          stops: [
            0.1,
            1,
          ]);

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? text,
    Color? grey,
    Color? error,
    Color? warning,
    Color? success,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      text: text ?? this.text,
      grey: grey ?? this.grey,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      text: Color.lerp(text, other.text, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}
