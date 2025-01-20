import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/genericModel/pagination_params.dart';
import 'package:flutter_task/core/utils/request_state_enums.dart';
import '../../domain/usecases/get_items_usecase.dart';
import 'items_event.dart';
import 'items_state.dart';

/// BLoC handling the state management for items feature
class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final GetItemsUseCase getItems;

  ItemsBloc(this.getItems) : super(ItemsState()) {
    on<LoadItems>(_onLoadItems);
  }

  /// Handles the [LoadItems] event
  ///
  /// Emits:
  /// - [ItemsLoading] when starting to load
  /// - [ItemsError] if an error occurs
  /// - [ItemsLoaded] when items are successfully loaded
  FutureOr<void> _onLoadItems(LoadItems event, Emitter<ItemsState> emit) async {
    // If loading more items and already reached max, do nothing
    if (event.isLoadMore && state.hasReachedMax) return;
    if (!event.isLoadMore) {
      emit(state.copyWith(requestState: RequestStateEnums.loading));
    }

    try {
      final page = event.isLoadMore ? state.currentPage + 1 : 1;

      final result = await getItems.call(PaginationParams(
        page: page,
        searchQuery: event.searchQuery ?? state.params?.searchQuery,
        sortField: event.sortField ?? state.params?.sortField,
        sortOrder: event.sortOrder ?? state.params?.sortOrder,
      ));

      result.fold(
        (failure) => emit(state.copyWith(
          errorMessage: failure.message,
          requestState: RequestStateEnums.error,
        )),
        (data) {
          final newItems =
              event.isLoadMore ? [...state.items, ...data.$1] : data.$1;

          emit(state.copyWith(
            items: newItems,
            requestState: RequestStateEnums.loaded,
            currentPage: page,
            hasReachedMax: newItems.length >= data.$2,
            totalItems: data.$2,
            params: PaginationParams(
                searchQuery: event.searchQuery,
                sortField: event.sortField,
                sortOrder: event.sortOrder,
                page: page),
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        requestState: RequestStateEnums.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
