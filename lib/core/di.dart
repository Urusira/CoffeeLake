import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';
import 'package:coffee_lake_app/features/auth/domain/usecases/AuthUseCase.dart';
import 'package:coffee_lake_app/features/profile/domain/usecases/UpdateProfileUseCase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../features/auth/data/datasources/AuthRemoteDataSource.dart';
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

  di.registerLazySingleton(() => AuthUseCase(di<AuthRepository>()));



  /******************************************

      Use Cases

   ******************************************/

  di.registerLazySingleton(() => GetProfileUseCase(di<AuthRepository>()));
  di.registerLazySingleton(() => UpdateProfileUseCase(di<AuthRepository>()));



  /******************************************

      Data Sources

  ******************************************/

  di.registerLazySingleton(() => AuthRemoteDataSource());



  /******************************************

      Repositories

   ******************************************/

  di.registerLazySingleton(() => AuthRepository(di<AuthRemoteDataSource>()));
}
