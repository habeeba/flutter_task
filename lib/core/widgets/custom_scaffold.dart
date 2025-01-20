import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/utils/request_state_enums.dart';
import 'package:flutter_task/core/widgets/custom_loading_widget.dart';
import '../utils/alert_type_enums.dart';
import '../utils/app_theme_colors.dart';
import '../utils/base_state.dart';
import 'custom_alert_dialog_widget.dart';

/// A generic scaffold that handles loading states and error dialogs.
///
/// The [bloc] parameter is optional. If provided, the scaffold will listen for
/// loading and error states emitted by the provided BLoC.
class CustomScaffold<B extends BlocBase<S>, S extends BaseState>
    extends StatelessWidget {
  /// The main content of the scaffold.
  final Widget body;

  /// The app bar of the scaffold.
  final PreferredSizeWidget? appBar;

  /// The message to display in the loading dialog.
  ///
  /// If `null`, a default message will be used.
  final String? loadingMessage;

  /// The background color of the loading overlay.
  ///
  /// Defaults to a semi-transparent black.
  final Color? loadingBackgroundColor;

  /// The bottom navigation bar of the scaffold.
  final Widget? bottomNavigationBar;

  /// The floating action button of the scaffold.
  final FloatingActionButton? floatingActionButton;

  /// The BLoC instance to listen to (optional).
  final B? bloc;

  /// Creates a new [CustomScaffold].
  ///
  /// The [body] parameter is required. The [bloc] parameter is optional.
  const CustomScaffold({
    super.key,
    required this.body,
    this.bloc,
    this.appBar,
    this.loadingMessage,
    this.loadingBackgroundColor,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: appColor(context)?.backgroundGradient,
            ),
            child: bloc != null
                ? BlocProvider<B>(
                    create: (_) => bloc!,
                    child: BlocListener<B, S>(
                      bloc: bloc,
                      listener: (context, state) {
                        if (state.requestState == RequestStateEnums.loading) {
                          LoadingWidget.show(
                            context,
                            message: loadingMessage ?? 'loading'.tr(),
                          );
                        } else {
                          LoadingWidget.hide(context);
                        }

                        if (state.requestState == RequestStateEnums.error &&
                            state.errorMessage != null) {
                          // Show an error dialog if the state is error and an error message is provided
                          customAlertDialog(
                            context: context,
                            message: state.errorMessage!,
                            alertType: AlertType.errorAlert,
                          );
                        }
                      },
                      child: body,
                    ),
                  )
                : body,
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
