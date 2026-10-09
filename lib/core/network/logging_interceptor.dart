import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  static const String _name = 'http';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      developer.log('--> ${options.method} ${options.uri}', name: _name);
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (kDebugMode) {
      developer.log(
        '<-- ${response.statusCode} ${response.requestOptions.uri}',
        name: _name,
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      developer.log(
        'xx ${err.response?.statusCode} ${err.requestOptions.uri}: '
        '${err.message}',
        name: _name,
      );
    }
    handler.next(err);
  }
}
