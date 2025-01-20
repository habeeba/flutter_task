import '../../domain/entities/item_entity.dart';

/// Data model class for Item entity
/// Handles JSON serialization/deserialization
class ItemModel extends ItemEntity {
  const ItemModel({
    required super.id,
    required super.title,
    required super.description,
    super.updatedAt,
  });

  /// Creates an ItemModel instance from JSON data
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['\$id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      updatedAt: DateTime.parse(json['\$updatedAt'] as String),
    );
  }

  /// Converts ItemModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      'title': title,
      'description': description,
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
