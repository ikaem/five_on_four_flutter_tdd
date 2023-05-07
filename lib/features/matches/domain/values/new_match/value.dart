import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class NewMatchValue with _$NewMatchValue {
  const factory NewMatchValue({
    required String matchName,
    required String locationName,
    // TODO this will probably need coordinates, instead of actual address - but that should come later only
    required String locationAddress,
    required String locationCity,
    required String locationCountry,
    required DateTime date,
    required TimeOfDay time,
    required bool isOrganizerJoined,
    required List<MatchParticipationValue> invitedPlayers,
  }) = _NewMatchValue;
}
