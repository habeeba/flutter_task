import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_theme_colors.dart';

/// A widget that displays a message state with an icon, title, and description.
///
/// This widget is commonly used to represent different states such as "loading",
/// "empty", or "initial" states in the UI. It provides a consistent and customizable
/// appearance for these scenarios.
class MessageStateWidget extends StatelessWidget {
  /// The icon to display at the top of the message state.
  /// This is typically a visual representation of the state (e.g., a checkmark, warning, or error icon).
  final IconData icon;

  /// The title text of the message state.
  /// This is usually a short, descriptive phrase that summarizes the state (e.g., "No Results Found").
  final String title;

  /// The description text providing additional context or instructions.
  /// This is optional and can be used to provide more details about the state or guide the user on what to do next.
  final String? description;

  /// Creates a new [MessageStateWidget].
  ///
  /// - [icon]: The icon to display at the top of the message state.
  /// - [title]: The title text of the message state.
  /// - [description]: The description text providing additional context or instructions.
  const MessageStateWidget({
    super.key,
    required this.icon,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the icon with a predefined size and color.
          Icon(
            icon,
            size: 64,
            color: appColor(context)?.grey,
          ),
          const SizedBox(height: 16), // Spacing between the icon and title.
          // Display the title text with a predefined style.
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8), // Spacing between the title and description.
          // Display the description text with a predefined style.
          if (description != null)
            Text(
              description!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}