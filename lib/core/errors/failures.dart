import 'package:equatable/equatable.dart';

/// Base failure class that all specific failures should extend
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Represents failures from server-side operations
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Represents network connectivity failures
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
