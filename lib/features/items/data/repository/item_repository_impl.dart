import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_task/core/genericModel/pagination_params.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/item_remote_datasource.dart';

/// Implementation of [ItemRepository].
///
/// This class handles data operations and error cases for fetching items.
/// It interacts with a remote data source to retrieve items and ensures
/// proper error handling, such as network connectivity checks and server exceptions.
class ItemRepositoryImpl implements ItemRepository {
  /// The remote data source used to fetch items.
  final ItemRemoteDataSource remoteDataSource;

  /// The network info utility to check for internet connectivity.
  final NetworkInfo networkInfo;

  /// Creates a new instance of [ItemRepositoryImpl].
  ///
  /// - [remoteDataSource]: The remote data source to use for fetching items.
  /// - [networkInfo]: The network info utility to check for internet connectivity.
  ItemRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, (List<ItemEntity>, int)>> getItems(PaginationParams params) async {
    // Check if the device is connected to the internet.
    if (await networkInfo.isConnected) {
      try {
        // Fetch items from the remote data source.
        final items = await remoteDataSource.getItems(params);
        // Return the items wrapped in a [Right] to indicate success.
        return Right(items);
      } on ServerException catch (e) {
        // Handle server exceptions by returning a [ServerFailure].
        return Left(ServerFailure(e.message));
      }
    } else {
      // Handle no internet connectivity by returning a [NetworkFailure].
      return Left(NetworkFailure('no_internet_error'.tr()));
    }
  }
}
