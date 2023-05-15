class MatchParticipationException implements Exception {
  MatchParticipationException(this.message);

  final String message;

  @override
  String toString() => "MatchParticipationException: $message";
}

class MatchParticipationExceptionInvalidRemoteData
    extends MatchParticipationException {
  MatchParticipationExceptionInvalidRemoteData({
    required String message,
  }) : super(message);

  @override
  String toString() => "MatchParticipationExceptionInvalidRemoteData: $message";
}

class MatchParticipationExceptionNotFoundRemote {
  MatchParticipationExceptionNotFoundRemote({
    required this.message,
  });

  final String message;

  @override
  String toString() => "MatchParticipationExceptionNotFoundRemote: $message";
}
