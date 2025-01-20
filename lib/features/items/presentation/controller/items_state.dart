import '../../../../../core/utils/request_state_enums.dart';
import '../../../../core/genericModel/pagination_params.dart';
import '../../../../core/utils/base_state.dart';
import '../../domain/entities/item_entity.dart';

/// State class for item-related states, extending [BaseState].
class ItemsState extends BaseState {
  final List<ItemEntity> items;
  final bool hasReachedMax;
  final PaginationParams? params;
  final int totalItems;
  final int currentPage;

  @override
  final RequestStateEnums
      requestState; // Use requestState instead of itemsState
  @override
  final String? errorMessage; // Use errorMessage instead of message

  ItemsState({
    this.items = const [],
    this.requestState = RequestStateEnums.initial,
    this.errorMessage,
    this.hasReachedMax = false,
    this.params,
    this.totalItems = 0,
    this.currentPage = 1,
  });

  /// Creates a copy of this state with updated properties.
  ItemsState copyWith({
    List<ItemEntity>? items,
    RequestStateEnums? requestState,
    String? errorMessage,
    bool? hasReachedMax,
    PaginationParams? params,
    int? totalItems,
    int? currentPage,
  }) {
    return ItemsState(
      items: items ?? this.items,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      params: params ?? this.params,
      totalItems: totalItems ?? this.totalItems,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
        items,
        requestState,
        errorMessage,
        hasReachedMax,
        params,
        totalItems,
        currentPage,
      ];
}
