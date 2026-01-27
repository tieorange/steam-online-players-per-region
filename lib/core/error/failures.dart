import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure();

  String get message;
  String get userFriendlyMessage;

  @override
  List<Object?> get props => [message, userFriendlyMessage];
}

final class ServerFailure extends Failure {

  const ServerFailure({required String message, this.statusCode}) : _message = message;
  final int? statusCode;
  final String _message;

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

  const NetworkFailure({required String message}) : _message = message;
  final String _message;

  @override
  String get message => _message;

  @override
  String get userFriendlyMessage => 'No internet connection. Please check your network.';
}

final class CacheFailure extends Failure {

  const CacheFailure({required String message}) : _message = message;
  final String _message;

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

  const EstimationFailure({required String message}) : _message = message;
  final String _message;

  @override
  String get message => _message;

  @override
  String get userFriendlyMessage => 'Could not estimate regional data.';
}
