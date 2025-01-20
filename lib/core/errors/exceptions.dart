/// Exception thrown when a server operation fails
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
