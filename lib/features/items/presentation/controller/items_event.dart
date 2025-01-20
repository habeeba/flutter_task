import 'package:equatable/equatable.dart';

/// Base class for all item-related events
abstract class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}

/// Event to trigger initial loading of items
/// Made all in one event as the appwriter use all in same API call
class LoadItems extends ItemsEvent {
  final String? searchQuery;
  final String? sortField;
  final String? sortOrder;
  final bool isLoadMore;

  const LoadItems({
    this.searchQuery,
    this.sortField,
    this.sortOrder,
    this.isLoadMore = false,
  });
}

