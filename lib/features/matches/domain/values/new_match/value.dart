import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/utils.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class NewMatchValue with _$NewMatchValue {
  const factory NewMatchValue({
    required String name,
    required String locationName,
    // TODO this will probably need coordinates, instead of actual address - but that should come later only
    required String locationAddress,
    required String locationCity,
    required String locationCountry,
    // TODO temp geocordiates are imprecise - we will need to get actual coordinates from the address - now we get it from the city
    required double? cityLongitude,
    required double? cityLatitude,
    required DateTime date,
    required TimeOfDay time,
    required bool isOrganizerJoined,
    required List<MatchParticipationValue> invitedPlayers,
  }) = _NewMatchValue;
}

// TODO move to extension
extension NewMatchValueExtension on NewMatchValue {
  NewMatchValue addParticipation(MatchParticipationValue participation) {
    final List<MatchParticipationValue> newInvitedPlayers = [
      ...invitedPlayers,
      participation,
    ];

    return copyWith(invitedPlayers: newInvitedPlayers);
  }

  FirestoreMatchDataValue toFirestoreMatchData({
    required String organizerId,
    required String organizerNickname,
  }) {
    final DateTime matchDate = time.toCustomDateTime(date);
    final Timestamp matchTimestamp = Timestamp.fromDate(matchDate);

// TODO create constants for fields
    final Map<String, dynamic> matchDataMap = {
      'name': name,
      // TODO this will need actual coordinates here - we will make it an object
      "location": {
        'locationName': locationName,
        'locationAddress': locationAddress,
        'locationCity': locationCity,
        'locationCountry': locationCountry,
        "cityLongitude": cityLongitude,
        "cityLatitude": cityLatitude,
      },
      "date": matchTimestamp,
      'isOrganizerJoined': isOrganizerJoined,
      'organizerId': organizerId,
      'organizerNickname': organizerNickname,
    };

    final List<Map<String, dynamic>> matchParticipantsMaps =
        invitedPlayers.map((ip) => ip.toFirestoreMap()).toList();

    return FirestoreMatchDataValue(
        matchDataMap: matchDataMap,
        participationsDataMaps: matchParticipantsMaps);
  }
}

// TODO move to values
class FirestoreMatchDataValue {
  FirestoreMatchDataValue({
    required this.matchDataMap,
    required this.participationsDataMaps,
  });

  final Map<String, dynamic> matchDataMap;
  final List<Map<String, dynamic>> participationsDataMaps;
}
