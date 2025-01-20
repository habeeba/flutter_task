import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/genericModel/pagination_params.dart';
import 'package:flutter_task/core/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import '../entities/item_entity.dart';
import '../repositories/item_repository.dart';

/// Use case for retrieving items
///
/// This class implements the single responsibility principle
/// and encapsulates the business logic for getting items
class GetItemsUseCase
    extends BaseUseCase<(List<ItemEntity>, int), PaginationParams> {
  final ItemRepository repository;

  GetItemsUseCase(this.repository);

  /// Executes the use case to retrieve items
  ///
  /// Returns [Either] with:
  /// - [Failure] if an error occurs
  /// - [List<ItemEntity>] if successful
  @override
  Future<Either<Failure, (List<ItemEntity>, int)>> call(
      PaginationParams params) async {
    return await repository.getItems(params);
  }
}
