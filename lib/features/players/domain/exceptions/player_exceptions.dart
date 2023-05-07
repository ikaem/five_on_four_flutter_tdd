class PlayerException implements Exception {
  PlayerException({
    required this.message,
  });
  final String message;

  @override
  String toString() => "PlayerException: $message";
}

class PlayerExceptionNotFoundRemotely extends PlayerException {
  PlayerExceptionNotFoundRemotely({
    required super.message,
  });

  @override
  String toString() => "PlayerExceptionNotFoundRemotely: $message";
}
