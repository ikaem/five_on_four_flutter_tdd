import 'package:meta/meta.dart';

@immutable
class AuthException implements Exception {
  final String message;

  const AuthException({required this.message});

  @override
  String toString() => message;
}

@immutable
class AuthExceptionUnauthorized extends AuthException {
  const AuthExceptionUnauthorized({required String message})
      : super(message: message);
}
