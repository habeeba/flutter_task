import 'package:equatable/equatable.dart';

/// Entity class representing an item in the domain layer
class ItemEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime? updatedAt;

  const ItemEntity({
    required this.id,
    required this.title,
    required this.description,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, description, updatedAt];
}
