sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;
}

final class NetworkException extends AppException {
  const NetworkException(super.message);
}

final class ServerException extends AppException {
  const ServerException(super.message, {this.statusCode});

  final int? statusCode;
}

final class ParsingException extends AppException {
  const ParsingException(super.message);
}

final class UnknownException extends AppException {
  const UnknownException(super.message);
}
