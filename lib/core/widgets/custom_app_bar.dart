import 'package:flutter/material.dart';

import '../utils/app_theme_colors.dart';

/// A custom app bar widget that implements [PreferredSizeWidget].
///
/// This app bar is designed to be reusable and customizable across the app.
/// It supports a title, actions, customizable colors, and other common app bar features.
///
/// ### Properties:
/// - `title`: The title of the app bar. This is required.
/// - `actions`: A list of widgets to display in the app bar's action area.
/// - `centerTitle`: Whether the title should be centered. Defaults to `true`.
/// - `elevation`: The elevation of the app bar. Defaults to `0`.
/// - `backgroundColor`: The background color of the app bar. If not provided,
///   a semi-transparent primary color will be used.
/// - `leading`: A widget to display at the start of the app bar (e.g., a back button).
///
/// ### Example Usage:
/// ```dart
/// CustomAppBar(
///   title: "Home",
///   actions: [
///     IconButton(
///       icon: Icon(Icons.search),
///       onPressed: () {
///         // Handle search action
///       },
///     ),
///   ],
///   centerTitle: true,
///   elevation: 2,
///   backgroundColor: Colors.blue,
///   leading: IconButton(
///     icon: Icon(Icons.arrow_back),
///     onPressed: () {
///       // Handle back action
///     },
///   ),
/// );
/// ```
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The title of the app bar.
  final String title;

  /// A list of widgets to display in the app bar's action area.
  final List<Widget>? actions;

  /// Whether the title should be centered.
  final bool centerTitle;

  /// The elevation of the app bar.
  final double elevation;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// A widget to display at the start of the app bar (e.g., a back button).
  final Widget? leading;

  /// A widget to display bottom.
  final PreferredSizeWidget? bottom;

  /// Creates a new [CustomAppBar].
  ///
  /// The [title] parameter is required. Other parameters are optional.
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.elevation = 0,
    this.backgroundColor,
    this.leading,
    this.bottom
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: appColor(context)?.text,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: centerTitle,
      elevation: elevation,
      backgroundColor: backgroundColor ??
          appColor(context)?.primary.withAlpha((0.7 * 255).round()),
      leading: leading,
      actions: actions,
      iconTheme: IconThemeData(color: appColor(context)?.text),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 80);
}