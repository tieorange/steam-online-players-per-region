sealed class AppException implements Exception {
  const AppException();
  String get message;
}

final class ServerException extends AppException {

  const ServerException({required String message, this.statusCode}) : _message = message;
  final int? statusCode;
  final String _message;

  @override
  String get message => _message;

  @override
  String toString() => 'ServerException: $_message (Status: $statusCode)';
}

final class NetworkException extends AppException {

  const NetworkException({required String message}) : _message = message;
  final String _message;

  @override
  String get message => _message;

  @override
  String toString() => 'NetworkException: $_message';
}

final class CacheException extends AppException {

  const CacheException({required String message}) : _message = message;
  final String _message;

  @override
  String get message => _message;

  @override
  String toString() => 'CacheException: $_message';
}
