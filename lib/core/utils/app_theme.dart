// Theme configuration
import 'package:flutter/material.dart';

import 'app_theme_colors.dart';

class AppTheme {
  static ThemeData light(BuildContext context) {
    return _baseTheme(context, AppThemeColors.light);
  }

  static ThemeData dark(BuildContext context) {
    return _baseTheme(context, AppThemeColors.dark);
  }

  static ThemeData _baseTheme(BuildContext context, AppColors colors) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness:
            colors == AppThemeColors.dark ? Brightness.dark : Brightness.light,
      ),
      extensions: [colors],
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Rubik',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colors.text,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colors.text,
        ),
        displaySmall: TextStyle(
          fontSize: 14,
          color: colors.text,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: colors.text,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: colors.text,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.text),
        titleTextStyle: TextStyle(
          color: colors.text,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
