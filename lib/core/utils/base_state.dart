import 'package:equatable/equatable.dart';

import 'request_state_enums.dart';

/// A base state class that includes request state and error message.
abstract class BaseState extends Equatable {
  /// The current request state.
  RequestStateEnums get requestState;

  /// The error message (if any).
  String? get errorMessage;

  @override
  List<Object?> get props => [
        requestState,
        errorMessage,
      ];
}
