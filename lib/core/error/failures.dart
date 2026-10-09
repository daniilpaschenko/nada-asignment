sealed class Failure {
  const Failure(this.message);

  final String message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.statusCode});

  final int? statusCode;
}

final class ParsingFailure extends Failure {
  const ParsingFailure(super.message);
}

final class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}
