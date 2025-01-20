import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../navigation/navigator_service/navigator_service.dart';
import '../utils/alert_type_enums.dart';
import '../utils/app_theme_colors.dart';
import 'custom_btn_widget.dart';

/// Displays a customizable alert dialog with an icon, title, message, and a button.
///
/// This function is used to show a consistent alert dialog across the app.
/// It supports different alert types (e.g., success, error) and a customizable button.
///
/// ### Parameters:
/// - `title`: The title of the alert dialog. If not provided, a default title
///   based on the `alertType` will be used.
/// - `message`: The message to display in the alert dialog. This is required.
/// - `alertType`: The type of alert (e.g., success, error). Defaults to `AlertType.successAlert`.
/// - `onTab`: A callback function that is triggered when the button is pressed.
/// - `context`: The build context required to show the dialog.
/// - `barrierDismiss`: If `true`, the dialog can be dismissed by tapping outside.
///   Defaults to `true`.
///
/// ### Example Usage:
/// ```dart
/// customAlertDialog(
///   title: "Error",
///   message: "An error occurred while processing your request.",
///   alertType: AlertType.errorAlert,
///   context: context,
///   onTab: () {
///     // Handle button tap
///   },
/// );
/// ```
void customAlertDialog({
  String? title,
  required String message,
  AlertType alertType = AlertType.successAlert,
  Function? onTab,
  required BuildContext context,
  bool barrierDismiss = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismiss,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: appColor(context)?.background,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display an icon based on the alert type
            Icon(
              alertType == AlertType.errorAlert
                  ? Icons.error_outline
                  : Icons.check_circle_outline,
              size: 40,
              color: alertType == AlertType.errorAlert
                  ? appColor(context)?.error
                  : appColor(context)?.success,
            ),
            const SizedBox(height: 16),
            // Display the title (or a default title based on the alert type)
            Text(
              title ??
                  (alertType == AlertType.errorAlert
                      ? "error_title".tr()
                      : "success_title".tr()),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: appColor(context)?.text,
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: appColor(context)?.grey,
            fontSize: 12,
          ),
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        actions: [
          // Primary button
          CustomButtonWidget(
            height: 54,
            bgColor: appColor(context)?.primary,
            borderRadius: 40,
            borderColor: appColor(context)?.primary,
            fontWeight: FontWeight.w500,
            fontHeight: 1.5,
            title: "OK".tr(),
            titleColor: appColor(context)?.text,
            actionBtn: () {
              AppNavigator.pop(); // Close the dialog
              onTab?.call(); // Trigger the button callback
            },
          ),
        ],
      );
    },
  );
}