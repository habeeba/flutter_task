class PaginationParams {
  final int page;
  final int limit;
  final String? searchQuery;
  final String? sortField;
  final String? sortOrder;

  const PaginationParams({
    this.page = 1,
    this.limit = 10,
    this.searchQuery,
    this.sortField,
    this.sortOrder,
  });

  PaginationParams copyWith({
    int? page,
    int? limit,
    String? searchQuery,
    String? sortField,
    String? sortOrder,
  }) {
    return PaginationParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      searchQuery: searchQuery ?? this.searchQuery,
      sortField: sortField ?? this.sortField,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}
