import 'package:flutter/material.dart';

/// A reusable card widget that displays a title, body, and an optional button.
///
/// This widget provides a consistent design for displaying content in a card format.
/// It can optionally include a button with customizable text, icon, and functionality.
class CardWidget extends StatelessWidget {
  /// The title text displayed at the top of the card.
  final String title;

  /// The body text providing additional information.
  final String body;

  /// Whether the card includes a button.
  /// Defaults to `false`.
  final bool hasButton;

  /// The text displayed on the button.
  /// Required if [hasButton] is `true`.
  final String? buttonText;

  /// The icon displayed next to the button text.
  final IconData? icon;

  /// The callback function triggered when the button is pressed.
  final VoidCallback? onPressed;

  /// Creates a [CardWidget].
  ///
  /// The [title] and [body] parameters are required. If [hasButton] is `true`,
  /// [buttonText] and [onPressed] must also be provided.
  const CardWidget({
    super.key,
    required this.title,
    required this.body,
    this.hasButton = false,
    this.buttonText,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                body,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: hasButton ? 16 : 0),
              if (hasButton)
                ElevatedButton.icon(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: Icon(icon),
                  label: Text(
                    buttonText!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
