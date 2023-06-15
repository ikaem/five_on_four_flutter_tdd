abstract class MatchesFirebaseConstants {
  // collections

  static const String firestoreCollectionMatches = 'matches';
  static const String firestoreMatchSubcollectionParticipants =
      'match_participants';

  // fields
  static const String firestoreMatchFieldName = 'name';
  static const String firestoreMatchFieldStartDate = 'date';
  static const String firestoreMatchFieldOrganizerId = "organizerId";
  static const String firestoreMatchFieldOrganizerNickname =
      "organizerNickname";

  static const String firestoreMatchParticipantFieldPlayerId = 'playerId';
  static const String firestoreMatchParticipantFieldStatus = 'status';
}
