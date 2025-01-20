import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/genericModel/pagination_params.dart';
import '../../../../core/errors/failures.dart';
import '../entities/item_entity.dart';

/// Abstract repository class defining the contract for item operations
abstract class ItemRepository {
  /// Retrieves a list of items from the data source
  ///
  /// Returns [Either] with:
  /// - [Failure] if an error occurs
  /// - [List<ItemEntity>] if successful
  Future<Either<Failure, (List<ItemEntity>, int)>> getItems(PaginationParams params);
}
