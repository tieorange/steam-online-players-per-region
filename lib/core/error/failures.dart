import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure();

  String get message;
  String get userFriendlyMessage;

  @override
  List<Object?> get props => [message, userFriendlyMessage];
}

final class ServerFailure extends Failure {
  final int? statusCode;
  final String _message;

  const ServerFailure({required String message, this.statusCode}) : _message = message;

  @override
  String get message => _message;

  @override
  String get userFriendlyMessage => statusCode == 429
      ? 'Rate limited. Please wait a moment.'
      : 'Server error. Please try again later.';

  @override
  List<Object?> get props => [statusCode, _message];
}

final class NetworkFailure extends Failure {
  final String _message;

  const NetworkFailure({required String message}) : _message = message;

  @override
  String get message => _message;

  @override
  String get userFriendlyMessage => 'No internet connection. Please check your network.';
}

final class CacheFailure extends Failure {
  final String _message;

  const CacheFailure({required String message}) : _message = message;

  @override
  String get message => _message;

  @override
  String get userFriendlyMessage => 'Unable to load cached data.';
}

final class TimeoutFailure extends Failure {
  @override
  String get message => 'Request timed out';

  @override
  String get userFriendlyMessage => 'Request timed out. Please try again.';
}

final class EstimationFailure extends Failure {
  final String _message;

  const EstimationFailure({required String message}) : _message = message;

  @override
  String get message => _message;

  @override
  String get userFriendlyMessage => 'Could not estimate regional data.';
}
