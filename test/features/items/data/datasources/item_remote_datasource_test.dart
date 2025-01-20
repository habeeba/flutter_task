import 'package:flutter_task/core/errors/exceptions.dart';
import 'package:flutter_task/core/genericModel/pagination_params.dart';
import 'package:flutter_task/features/items/data/datasources/item_remote_datasource.dart';
import 'package:flutter_task/features/items/data/model/item_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:appwrite/appwrite.dart';
import 'package:mockito/annotations.dart';
import 'package:appwrite/models.dart' as models;

import 'item_remote_datasource_test.mocks.dart';

@GenerateMocks([Databases])
void main() {
  late ItemRemoteDataSourceImpl dataSource;
  late MockDatabases mockDatabases;

  setUp(() {
    mockDatabases = MockDatabases(); // Initialize the mock
    dataSource = ItemRemoteDataSourceImpl(mockDatabases);
  });

  test('getItems returns a list of ItemModel', () async {
    // Arrange
    when(mockDatabases.listDocuments(
      databaseId: anyNamed('databaseId'),
      collectionId: anyNamed('collectionId'),
    )).thenAnswer((_) async => models.DocumentList(
          total: 2, // Total number of documents
          documents: [
            models.Document(
              $id: '1',
              $collectionId: 'items',
              $databaseId: 'main',
              $createdAt: '2023-10-01T00:00:00.000Z',
              $updatedAt: '2023-10-01T00:00:00.000Z',
              $permissions: [],
              data: {
                '\$id': '1',
                'title': 'Item 1',
                'description': 'Description 1'
              },
            ),
            models.Document(
              $id: '2',
              $collectionId: 'items',
              $databaseId: 'main',
              $createdAt: '2023-10-01T00:00:00.000Z',
              $updatedAt: '2023-10-01T00:00:00.000Z',
              $permissions: [],
              data: {
                '\$id': '2',
                'title': 'Item 2',
                'description': 'Description 2'
              },
            ),
          ],
        ));

    // Act
    final result = await dataSource.getItems(PaginationParams());

    // Assert
    expect(result, isA<List<ItemModel>>());
    expect(result.$1.length, 2); // Verify the number of items
    expect(result.$1[0].id, '1'); // Verify the first item's ID
    expect(result.$1[0].title, 'Item 1'); // Verify the first item's title
    expect(result.$1[0].description,
        'Description 1'); // Verify the first item's description
    expect(result.$1[1].id, '2'); // Verify the second item's ID
    expect(result.$1[1].title, 'Item 2'); // Verify the second item's title
    expect(result.$1[1].description,
        'Description 2'); // Verify the second item's description
  });

  test('getItems throws ServerException on AppwriteException', () async {
    // Arrange
    when(mockDatabases.listDocuments(
      databaseId: anyNamed('databaseId'),
      collectionId: anyNamed('collectionId'),
    )).thenThrow(AppwriteException('Appwrite error'));

    // Act & Assert
    expect(
      () => dataSource.getItems(PaginationParams()),
      throwsA(isA<ServerException>()),
    );
  });

  test('getItems throws ServerException on generic exception', () async {
    // Arrange
    when(mockDatabases.listDocuments(
      databaseId: anyNamed('databaseId'),
      collectionId: anyNamed('collectionId'),
    )).thenThrow(Exception('Generic error'));

    // Act & Assert
    expect(
      () => dataSource.getItems(PaginationParams()),
      throwsA(isA<ServerException>()),
    );
  });
}
