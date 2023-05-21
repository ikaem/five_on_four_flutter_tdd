class HttpRequestException implements Exception {
  const HttpRequestException({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  @override
  String toString() =>
      'HttpRequestException: message: $message, statusCode: $statusCode';
}

class HttpRequestExceptionDataNotFound extends HttpRequestException {
  const HttpRequestExceptionDataNotFound({
    required String message,
    required int statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  @override
  String toString() =>
      'HttpRequestExceptionDataNotFound: message: $message, statusCode: $statusCode';
}
