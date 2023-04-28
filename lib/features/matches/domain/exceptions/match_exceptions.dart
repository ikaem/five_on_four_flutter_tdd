class MatchException implements Exception {
  const MatchException({
    required this.message,
  });

  final String message;

  @override
  String toString() => "MatchException: $message";
}

class MatchExceptionNotFoundLocal implements Exception {
  const MatchExceptionNotFoundLocal({
    required this.message,
  });

  final String message;

  @override
  String toString() => "MatchExceptionNotFoundLocal: $message";
}

class MatchExceptionNotFoundRemote implements Exception {
  const MatchExceptionNotFoundRemote({
    required this.message,
  });

  final String message;

  @override
  String toString() => "MatchExceptionNotFoundRemote: $message";
}

class MatchExceptionPlayerAlreadyJoined implements Exception {
  const MatchExceptionPlayerAlreadyJoined({
    required this.message,
  });

  final String message;

  @override
  String toString() => "MatchExceptionPlayerAlreadyJoined: $message";
}
