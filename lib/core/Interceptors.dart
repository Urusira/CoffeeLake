import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AddTokenInterceptor extends Interceptor {
  final FlutterSecureStorage chest;

  AddTokenInterceptor({required this.chest});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final poki = await chest.read(key: 'poki');
    if(poki != null) {
      options.headers['Authorization'] = 'Bearer $poki';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode == 401) {
      await chest.delete(key: 'poki');
      return handler.next(err);
    }
  }
}