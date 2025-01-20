import 'package:flutter/material.dart';

import '../utils/app_theme_colors.dart';

/// A customizable button widget that supports various styling options such as
/// background color, gradient, border, text styling, and more.
///
/// This widget can be used to create buttons with custom designs, including
/// gradient backgrounds, rounded corners, and custom child widgets.
class CustomButtonWidget extends StatelessWidget {
  /// Creates a [CustomButtonWidget].
  ///
  /// - [title]: The text to display on the button. If not provided, [child] will be used.
  /// - [child]: A custom widget to display inside the button. If not provided, [title] will be used.
  /// - [actionBtn]: The callback function to execute when the button is pressed.
  /// - [bgColor]: The background color of the button. Defaults to the primary color from the app theme.
  /// - [width]: The width of the button. Defaults to `double.infinity` (full width).
  /// - [height]: The height of the button. Defaults to 60.
  /// - [borderRadius]: The border radius of the button. Defaults to 10.
  /// - [gradient]: A gradient to use as the background of the button.
  /// - [titleColor]: The color of the button text. Defaults to the text color from the app theme.
  /// - [fontSize]: The font size of the button text. Defaults to 20.
  /// - [fontWeight]: The font weight of the button text.
  /// - [fontHeight]: The height of the button text. Defaults to 1.5.
  /// - [padding]: The padding around the button.
  /// - [borderColor]: The color of the button border. Defaults to transparent.
  const CustomButtonWidget({
    this.title,
    this.child,
    required this.actionBtn,
    this.bgColor,
    this.width,
    this.borderRadius,
    this.height,
    this.gradient,
    this.titleColor,
    this.fontSize,
    this.fontWeight,
    this.fontHeight,
    this.padding,
    this.borderColor,
    super.key,
  });

  final Widget? child;
  final String? title;
  final double? width;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? fontHeight;
  final double? borderRadius;
  final Function actionBtn;
  final Gradient? gradient;
  final Color? bgColor;
  final Color? titleColor;
  final EdgeInsets? padding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () => actionBtn(),
        child: Container(
          height: height ?? 60,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            gradient: gradient,
            color: bgColor ?? appColor(context)?.primary,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: Border.all(color: borderColor ?? Colors.transparent),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: child ??
                  Text(
                    title ?? "",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: titleColor ?? appColor(context)?.text,
                      fontWeight: fontWeight,
                      fontSize: fontSize ?? 20,
                      height: fontHeight ?? 1.5,
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}