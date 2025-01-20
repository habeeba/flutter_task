import 'package:appwrite/appwrite.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/genericModel/pagination_params.dart';
import '../model/item_model.dart';

/// Abstract class defining remote data source operations for items.
///
/// This class serves as a contract for fetching items from a remote data source.
/// Implementations of this class should provide the logic to retrieve items
/// from a specific remote source (e.g., a database, API, etc.).
abstract class ItemRemoteDataSource {
  /// Retrieves a list of items from the remote data source.
  ///
  /// This method fetches items from the remote source and returns them as a list
  /// of [ItemModel] objects.
  ///
  /// Throws a [ServerException] if the operation fails due to a server error
  /// or other issues.
  Future<(List<ItemModel>, int)> getItems(PaginationParams params);
}

/// Implementation of [ItemRemoteDataSource] using Appwrite as the remote data source.
///
/// This class provides the logic to fetch items from an Appwrite database.
/// It uses the [Databases] client from the Appwrite SDK to interact with the database.
class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  /// The Appwrite [Databases] client used to interact with the database.
  final Databases databases;

  /// Creates a new instance of [ItemRemoteDataSourceImpl].
  ///
  /// - [databases]: The Appwrite [Databases] client to use for database operations.
  ItemRemoteDataSourceImpl(this.databases);

  @override
  Future<(List<ItemModel>, int)> getItems(PaginationParams params) async {
    try {
      final queries = [
        Query.limit(params.limit),
        Query.offset((params.page - 1) * params.limit),
      ];

      if (params.searchQuery?.isNotEmpty ?? false) {
        queries.add(Query.search('title', params.searchQuery!));
      }

      if (params.sortField != null && params.sortOrder != null) {
        queries.add(
          params.sortOrder == 'desc'
              ? Query.orderDesc(params.sortField!)
              : Query.orderAsc(params.sortField!),
        );
      }
      // Fetch documents from the Appwrite database.
      final response = await databases.listDocuments(
        databaseId: AppConfig.databaseId,
        collectionId: AppConfig.collectionId,
      );

      // Convert the retrieved documents into a list of [ItemModel] objects.
      final List<ItemModel> items = response.documents
          .map((doc) => ItemModel.fromJson(doc.data))
          .toList();
      return (items, response.total);
    } on AppwriteException catch (e) {
      // Handle Appwrite-specific exceptions.
      throw ServerException('Appwrite error: ${e.message}');
    } catch (e) {
      // Handle any other exceptions.
      throw ServerException('Failed to fetch items: $e');
    }
  }
}
