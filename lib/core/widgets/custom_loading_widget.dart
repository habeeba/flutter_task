import 'dart:ui';
import 'package:flutter/material.dart';

import '../navigation/navigator_service/navigator_service.dart';

/// A widget that displays a loading indicator with optional text, a darkened overlay, and a blur effect.
///
/// This widget is commonly used to indicate a loading state in the UI.
/// It provides a circular progress indicator, a customizable message,
/// and a semi-transparent overlay with a blur effect to block interactions.
class LoadingWidget extends StatelessWidget {
  /// The text to display below the loading indicator.
  ///
  /// If `null`, no text will be shown.
  final String? message;

  /// The background color of the overlay.
  ///
  /// Defaults to a semi-transparent black.
  final Color overlayColor;

  /// The blur intensity for the overlay.
  ///
  /// Defaults to `5.0` for both `sigmaX` and `sigmaY`.
  final double blurIntensity;

  /// The color of the circular progress indicator.
  ///
  /// Defaults to the theme's primary color.
  final Color? progressIndicatorColor;

  /// The stroke width of the circular progress indicator.
  ///
  /// Defaults to `5.0`.
  final double progressIndicatorStrokeWidth;

  /// Creates a new [LoadingWidget].
  ///
  /// The [message] parameter is optional. The [overlayColor] parameter
  /// defaults to a semi-transparent black. The [blurIntensity] parameter
  /// controls the intensity of the blur effect. The [progressIndicatorColor]
  /// and [progressIndicatorStrokeWidth] parameters allow customization of
  /// the progress indicator.
  const LoadingWidget({
    super.key,
    this.message,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.blurIntensity = 5.0,
    this.progressIndicatorColor,
    this.progressIndicatorStrokeWidth = 5.0,
  });

  /// Shows a loading dialog with an optional message.
  ///
  /// The [context] parameter is required to show the dialog.
  /// The [message] parameter is optional and will be displayed below the progress indicator.
  static void show(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => LoadingWidget(message: message),
    );
  }

  /// Hides the currently visible loading dialog.
  ///
  /// The [context] parameter is required to hide the dialog.
  /// If no dialog is shown, this method does nothing.
  static void hide(BuildContext context) {
    AppNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Darkened overlay with blur
        BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: blurIntensity, sigmaY: blurIntensity),
          child: Container(
            color: overlayColor,
          ),
        ),
        // Loading content
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: progressIndicatorStrokeWidth,
                color: progressIndicatorColor ?? Theme.of(context).primaryColor,
              ),
              if (message != null) ...[
                const SizedBox(height: 16),
                Text(
                  message!,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
