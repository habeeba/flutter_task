import 'package:flutter_task/features/items/data/model/item_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testItemModel = ItemModel(
    id: '1',
    title: 'Item 1',
    description: 'Description 1',
  );

  const testJson = {
    '\$id': '1',
    'title': 'Item 1',
    'description': 'Description 1',
  };

  test('ItemModel should be correctly created from JSON', () {
    // Act
    final result = ItemModel.fromJson(testJson);

    // Assert
    expect(result.id, '1');
    expect(result.title, 'Item 1');
    expect(result.description, 'Description 1');
  });

  test('ItemModel should be correctly converted to JSON', () {
    // Act
    final result = testItemModel.toJson();

    // Assert
    expect(result, testJson);
  });
}