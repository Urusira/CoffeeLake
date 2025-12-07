import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';
import 'package:coffee_lake_app/features/auth/domain/usecases/AuthUseCase.dart';
import 'package:coffee_lake_app/features/cart/data/datasources/CartLocalDataSource.dart';
import 'package:coffee_lake_app/features/cart/domain/repositories/CartRepository.dart';
import 'package:coffee_lake_app/features/cart/domain/usecases/CartAddUseCase.dart';
import 'package:coffee_lake_app/features/cart/domain/usecases/CartContainsUseCase.dart';
import 'package:coffee_lake_app/features/cart/domain/usecases/CartCountProductUseCase.dart';
import 'package:coffee_lake_app/features/menu/data/datasources/MenuRemoteDataSource.dart';
import 'package:coffee_lake_app/features/menu/domain/usecases/GetMenuUseCase.dart';
import 'package:coffee_lake_app/features/order/domain/usecases/GetBonusesFlagUseCase.dart';
import 'package:coffee_lake_app/features/order/domain/usecases/OrderGetTotalsUseCase.dart';
import 'package:coffee_lake_app/features/order/domain/usecases/OrderGetUsedBonusesUseCase.dart';
import 'package:coffee_lake_app/features/order/domain/usecases/OrderPushUseCase.dart';
import 'package:coffee_lake_app/features/order/domain/usecases/OrderRecalUsedBonusesUseCase.dart';
import 'package:coffee_lake_app/features/order/domain/usecases/OrderToggleBonusesUseCase.dart';
import 'package:coffee_lake_app/features/profile/domain/usecases/ProfileGetBonusesUseCase.dart';
import 'package:coffee_lake_app/features/profile/domain/usecases/UpdateProfileUseCase.dart';
import 'package:coffee_lake_app/services/OrderService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/data/datasources/AuthRemoteDataSource.dart';
import '../features/cart/domain/usecases/CartGetUseCase.dart';
import '../features/cart/domain/usecases/CartRemoveUseCase.dart';
import '../features/menu/domain/usecases/GetDetailsUseCase.dart';
import '../features/profile/domain/usecases/GetProfileUseCase.dart';
import 'Interceptors.dart';
import 'Network.dart';

final GetIt di = GetIt.instance;

void diSetup() {
  /******************************************

      Storage

   ******************************************/

  di.registerLazySingleton(() => const FlutterSecureStorage());

  /******************************************

      Networking

   ******************************************/

  di.registerLazySingleton(() => AddTokenInterceptor());

  di.registerLazySingleton(() => Network(di<FlutterSecureStorage>()));
  di.registerLazySingleton(() => di<Network>().dio);

  /******************************************

      Use Cases

   ******************************************/

  di.registerLazySingleton(() => GetProfileUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => UpdateProfileUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => AuthUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => ProfileGetBonusesUseCase(di<AuthRepository>()));

  di.registerLazySingleton(() => GetMenuUseCase(di<MenuRemoteDataSource>()));
  di.registerLazySingleton(() => GetDetailsUseCase(di<MenuRemoteDataSource>()));

  di.registerLazySingleton(() => CartAddUseCase(di<CartRepository>()));
  di.registerLazySingleton(() => CartContainsUseCase(di<CartRepository>()));
  di.registerLazySingleton(() => CartCountProductUseCase(di<CartRepository>()));
  di.registerLazySingleton(() => CartGetUseCase(di<CartRepository>()));
  di.registerLazySingleton(() => CartRemoveUseCase(di<CartRepository>()));

  di.registerLazySingleton(() => OrderGetTotalsUseCase(di<OrderService>()));
  di.registerLazySingleton(() => OrderGetUsedBonusesUseCase(di<OrderService>()));
  di.registerLazySingleton(() => OrderPushUseCase(di<OrderService>()));
  di.registerLazySingleton(() => OrderRecalUsedBonusesUseCase(di<OrderService>()));
  di.registerLazySingleton(() => GetBonusesFlagUseCase(di<OrderService>()));
  di.registerLazySingleton(() => OrderToggleBonusesUseCase(di<OrderService>()));

  /******************************************

      Data Sources

   ******************************************/

  di.registerLazySingleton(() => AuthRemoteDataSource());
  di.registerLazySingleton(() => MenuRemoteDataSource());
  di.registerLazySingleton(() => CartLocalDataSource());

  /******************************************

      Repositories

   ******************************************/

  di.registerLazySingleton(() => AuthRepository(di<AuthRemoteDataSource>()));
  di.registerLazySingleton(() => CartRepository(di<CartLocalDataSource>()));

  /******************************************

      Services

   ******************************************/

  di.registerLazySingleton(() => OrderService(di<CartRepository>(), di<AuthRepository>()));
}
