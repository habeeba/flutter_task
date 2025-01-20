import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Abstract class defining network connectivity checking operations
abstract class NetworkInfo {
  /// Checks if device has internet connection
  Future<bool> get isConnected;
}

/// Implementation of NetworkInfo using InternetConnectionChecker
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
