import 'package:appwrite/appwrite.dart';

/// Service class handling Appwrite initialization and authentication
class AppwriteService {
  final Client client;
  final Account account;
  final Databases databases;

  /// Initializes Appwrite client with project configuration
  AppwriteService({
    required this.client,
    required this.databases,
    required this.account,
  });

  /// Creates an anonymous session for the user
  ///
  /// Throws [AppwriteException] if session creation fails
  Future<void> createAnonymousSession() async {
    try {
      await account.createAnonymousSession();
    } catch (e) {
      throw AppwriteException('Failed to create anonymous session: $e');
    }
  }

  /// Logs out the current user by deleting their session
  ///
  /// Throws [AppwriteException] if logout fails
  Future<void> logout() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {
      throw AppwriteException('Failed to logout: $e');
    }
  }
}
