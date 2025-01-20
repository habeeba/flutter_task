import 'package:flutter/material.dart';
import 'package:flutter_task/core/widgets/custom_card_widget.dart';
import 'package:flutter_task/features/items/domain/entities/item_entity.dart';

/// Widget displaying individual item details
class ItemCard extends StatelessWidget {
  final ItemEntity item;

  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      title: item.title,
      body: item.description,
    );
  }
}
