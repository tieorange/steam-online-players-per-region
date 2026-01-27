sealed class AppException implements Exception {
  String get message;
  const AppException();
}

final class ServerException extends AppException {
  final int? statusCode;
  final String _message;

  const ServerException({required String message, this.statusCode}) : _message = message;

  @override
  String get message => _message;

  @override
  String toString() => 'ServerException: $_message (Status: $statusCode)';
}

final class NetworkException extends AppException {
  final String _message;

  const NetworkException({required String message}) : _message = message;

  @override
  String get message => _message;

  @override
  String toString() => 'NetworkException: $_message';
}

final class CacheException extends AppException {
  final String _message;

  const CacheException({required String message}) : _message = message;

  @override
  String get message => _message;

  @override
  String toString() => 'CacheException: $_message';
}
