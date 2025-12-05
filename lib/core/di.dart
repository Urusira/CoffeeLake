import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';
import 'package:coffee_lake_app/features/auth/domain/usecases/AuthUseCase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/data/datasources/AuthRemoteDataSource.dart';
import '../features/profile/domain/usecases/GetProfileUseCase.dart';
import 'Interceptors.dart';
import 'Network.dart';

final GetIt di = GetIt.instance;

void diSetup() {
  di.registerLazySingleton(() => const FlutterSecureStorage());

  di.registerLazySingleton(
    () => AddTokenInterceptor(chest: di<FlutterSecureStorage>()),
  );

  di.registerLazySingleton(() => Network(di<FlutterSecureStorage>()));
  di.registerLazySingleton(() => di<Network>().dio);

  di.registerLazySingleton(() => AuthUseCase(di<AuthRepository>()));

  di.registerLazySingleton(() => GetProfileUseCase(di<AuthRepository>()));

  di.registerLazySingleton(() => AuthRemoteDataSource());

  di.registerLazySingleton(() => AuthRepository(di<AuthRemoteDataSource>()));
}
