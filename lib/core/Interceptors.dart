import 'package:coffee_lake_app/features/auth/domain/repositories/AuthRepository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'di.dart';

class AddTokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final poki = await di<AuthRepository>().getToken();
    if(poki != null) {
      options.headers['Authorization'] = 'Bearer $poki';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode == 401 || err.response?.statusCode == 404) {
      di<AuthRepository>().logout();
      return handler.next(err);
    }
  }
}