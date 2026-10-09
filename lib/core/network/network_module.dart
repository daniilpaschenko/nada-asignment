import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../constants/app_constants.dart';
import 'logging_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.profilesBaseUrl,
        connectTimeout: AppConstants.connectTimeout,
        receiveTimeout: AppConstants.receiveTimeout,
      ),
    );
    dio.interceptors.add(LoggingInterceptor());
    return dio;
  }
}
