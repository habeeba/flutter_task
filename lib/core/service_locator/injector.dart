import 'package:appwrite/appwrite.dart';
import 'package:flutter_task/core/services/appwrite_services.dart';
import 'package:flutter_task/features/items/domain/usecases/get_items_usecase.dart';
import 'package:flutter_task/features/items/presentation/controller/items_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/items/data/datasources/item_remote_datasource.dart';
import '../../features/items/data/repository/item_repository_impl.dart';
import '../../features/items/domain/repositories/item_repository.dart';
import '../config/app_config.dart';
import '../constants/app_constants.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Network
  sl.registerLazySingleton<Client>(() => Client()
    ..setEndpoint(AppConstants.appwriteEndpoint)
    ..setProject(AppConfig.projectId));
  sl.registerLazySingleton<Databases>(() => Databases(sl()));
  sl.registerLazySingleton(
      () => AppwriteService(client: sl(), databases: sl(), account: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// Repository
  sl.registerLazySingleton<ItemRemoteDataSource>(
      () => ItemRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<ItemRepository>(
    () => ItemRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  ///Bloc
  sl.registerFactory(() => ItemsBloc(sl()));

  /// UseCase
  sl.registerLazySingleton(() => GetItemsUseCase(sl()));
}
