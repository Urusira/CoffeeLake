import 'package:coffee_lake_app/core/Interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'di.dart';

class Network {
  final Dio dio;

  Network(FlutterSecureStorage storage)
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://maidenly-smart-dragonfly.cloudpub.ru/api/',
          connectTimeout: const Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(di<AddTokenInterceptor>());
  }
}
