import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_message_state_widget.dart';
import '../../domain/entities/item_entity.dart';
import 'item_card.dart';

/// A widget that displays a list of items.
///
/// This widget is used to show a scrollable list of [ItemEntity] objects.
/// If the list of items is empty, it displays a [MessageStateWidget] to indicate
/// that no items were found or to show a custom message state.
class ItemsList extends StatefulWidget {
  /// The list of items to display.
  final List<ItemEntity> items;

  /// An optional [MessageStateWidget] to display when the list of items is empty.
  /// If not provided, a default message state widget is shown.
  final MessageStateWidget? messageStateWidget;

  /// Whether all items have been loaded
  final bool hasReachedMax;

  /// Callback when more items should be loaded
  final VoidCallback? onLoadMore;

  /// Creates a new [ItemsList].
  ///
  /// - [items]: The list of items to display.
  /// - [messageStateWidget]: An optional widget to display when no items are found.
  const ItemsList({
    super.key,
    required this.items,
    this.messageStateWidget,
    this.hasReachedMax = false,
    this.onLoadMore,
  });

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return widget.items.isEmpty
        ? Center(
            // Display the custom message state widget or a default one.
            child: widget.messageStateWidget ??
                MessageStateWidget(
                  icon: Icons.search_off,
                  title: 'no_items_found_title'.tr(),
                  description: 'no_items_found_description'.tr(),
                ),
          )
        :
            // Display a scrollable list of items.
            ListView.builder(
              controller: _scrollController,
              itemCount: widget.items.length + (widget.hasReachedMax ? 0 : 1),
              itemBuilder: (context, index) {
                if (index >= widget.items.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return ItemCard(item: widget.items[index]);
              },
           
          );
  }

  void _onScroll() {
    if (_isBottom && !widget.hasReachedMax && widget.onLoadMore != null) {
      widget.onLoadMore!();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
