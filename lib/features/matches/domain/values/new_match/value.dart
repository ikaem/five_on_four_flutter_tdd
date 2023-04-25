import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participant_invitation/value.dart';
import 'package:flutter/material.dart';

@immutable
class NewMatchValue {
  const NewMatchValue({
    required this.matchName,
    required this.locationName,
    required this.locationAddress,
    required this.locationCity,
    required this.locationCountry,
    required this.date,
    required this.time,
    required this.isOrganizerJoined,
    required this.invitedPlayers,
  });
  // TODO this will need more fileds

  final String matchName;
  final String locationName;
  // TODO this will probably need coordinates, instead of actual address - but that should come later only
  final String locationAddress;
  final String locationCity;
  final String locationCountry;
  final DateTime date;
  final TimeOfDay time;
  // TODO for this one, we should later set its status to confirmed, or joined or something
  final bool isOrganizerJoined;
  // TODO this will need to be added separatedly to firebase - this is a subcollection
  final List<MatchParticipantInvitationValue> invitedPlayers;

  // TODO
}
