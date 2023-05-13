class PlayerException implements Exception {
  PlayerException({
    required this.message,
  });
  final String message;

  @override
  String toString() => "PlayerException: $message";
}

class PlayerExceptionNotFoundRemote extends PlayerException {
  PlayerExceptionNotFoundRemote({
    required super.message,
  });

  @override
  String toString() => "PlayerExceptionNotFoundRemote: $message";
}
