import 'package:dio/dio.dart';

import 'exceptions.dart';
import 'failures.dart';

AppException mapDioExceptionToAppException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return const NetworkException(
        'Unable to reach the server. Check your connection and try again.',
      );
    case DioExceptionType.badResponse:
      return ServerException(
        'The server returned an unexpected response.',
        statusCode: exception.response?.statusCode,
      );
    case DioExceptionType.badCertificate:
      return const NetworkException(
        'The server certificate could not be verified.',
      );
    case DioExceptionType.cancel:
      return const UnknownException('The request was cancelled.');
    case DioExceptionType.transformTimeout:
      return const UnknownException(
        'The server response took too long to process.',
      );
    case DioExceptionType.unknown:
      return UnknownException(
        exception.message ?? 'An unexpected error occurred.',
      );
  }
}

Failure mapExceptionToFailure(Object error) {
  if (error is DioException) {
    return mapExceptionToFailure(mapDioExceptionToAppException(error));
  }
  if (error is FormatException) {
    return const ParsingFailure('The server response could not be parsed.');
  }
  if (error is AppException) {
    return switch (error) {
      NetworkException(:final String message) => NetworkFailure(message),
      ServerException(:final String message, :final int? statusCode) =>
        ServerFailure(message, statusCode: statusCode),
      ParsingException(:final String message) => ParsingFailure(message),
      UnknownException(:final String message) => UnknownFailure(message),
    };
  }
  return UnknownFailure(error.toString());
}
