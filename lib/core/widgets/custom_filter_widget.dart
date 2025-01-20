import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomFilterWidget extends StatelessWidget {
  final Function(String, String) onSort;

  const CustomFilterWidget({
    super.key,
    required this.onSort,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Map<String, String>>(
      icon: const Icon(Icons.filter_list),
      offset: const Offset(0, 40),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: {'field': '\$updatedAt', 'order': 'desc'},
          child: Text('sort_by_updated_at'.tr()),
        ),
        PopupMenuItem(
          value: {'field': 'title', 'order': 'asc'},
          child: Text('sort_by_title'.tr()),
        ),
      ],
      onSelected: (value) => onSort(value['field']!, value['order']!),
    );
  }
}
