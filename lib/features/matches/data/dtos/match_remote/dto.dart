import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "dto.freezed.dart";

@freezed
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO({
    required String id,
    required String name,
    required int date,
    required MatchRemoteLocationDTO location,
    required List<MatchParticipantRemoteDTO> participants,
  }) = _MatchRemoteDTO;

  // TODO needed only for dev
  factory MatchRemoteDTO.fromNewMatchValue({
    required String matchId,
    required String organizerId,
    required NewMatchValue matchValue,
  }) {
    final List<MatchParticipantRemoteDTO> participants =
        matchValue.invitedPlayers.map((e) {
      final String participantStatus =
          matchValue.isOrganizerJoined && e.playerId == organizerId
              ? MatchParticipantStatus.joined.name
              : MatchParticipantStatus.invited.name;

      final MatchParticipantRemoteDTO participantRemoteDTO =
          MatchParticipantRemoteDTO.fromMatchParticipantInvitationValue(
        invitationValue: e,
        matchId: matchId,
        status: participantStatus,
      );

      return participantRemoteDTO;
    }).toList();

    final MatchRemoteDTO dto = MatchRemoteDTO(
      id: matchId,
      name: matchValue.name,
      participants: participants,
      date: matchValue.date.millisecondsSinceEpoch,
      location: MatchRemoteLocationDTO(
        cityLatitude: 45.815,
        cityLongitude: 15.9819,
        locationAddress: "Some Adddress",
        locationName: "Some Location Name",
        locationCountry: "Croatia",
        locationCity: "Zagreb",
      ),
    );

    return dto;
  }

  factory MatchRemoteDTO.fromFirestoreDocs({
    required DocumentSnapshot<Map<String, dynamic>> matchDoc,
    required List<QueryDocumentSnapshot<Map<String, dynamic>>>
        participantsQueryDocs,
  }) {
    final String matchId = matchDoc.id;
    final Map<String, dynamic>? matchData = matchDoc.data();

    if (matchData == null) {
      throw MatchExceptionNotFoundRemote(
        message: "Match participation data is null: $matchId",
      );
    }

    final List<MatchParticipantRemoteDTO> participantsDtos =
        participantsQueryDocs
            .map((e) => MatchParticipantRemoteDTO.fromFirestoreDoc(
                  doc: e,
                ))
            .toList();

    final int matchDate =
        (matchData['date'] as Timestamp).millisecondsSinceEpoch;

    final MatchRemoteLocationDTO matchLocation =
        MatchRemoteLocationDTO.fromFirestoreMap(
      matchData["location"] as Map<String, dynamic>,
    );

    final MatchRemoteDTO matchDto = MatchRemoteDTO(
      id: matchDoc.id,
      name: matchData['name'] as String,
      date: matchDate,
      participants: participantsDtos,
      location: matchLocation,
    );

    return matchDto;
  }
}

// TODO keep simple for now - might need to be moved in the future
// TODO maybe will need to be generated with freezed
@immutable
class MatchRemoteLocationDTO {
  const MatchRemoteLocationDTO({
    required this.cityLatitude,
    required this.cityLongitude,
    required this.locationAddress,
    required this.locationName,
    required this.locationCountry,
    required this.locationCity,
  });

  factory MatchRemoteLocationDTO.fromFirestoreMap(
    Map<String, dynamic> locationMap,
  ) {
    final double? cityLatitude = locationMap['cityLatitude'] as double?;
    final double? cityLongitude = locationMap['cityLongitude'] as double?;
    final String locationAddress = locationMap['locationAddress'] as String;
    final String locationName = locationMap['locationName'] as String;
    final String locationCountry = locationMap['locationCountry'] as String;
    final String locationCity = locationMap['locationCity'] as String;

    final MatchRemoteLocationDTO locationDto = MatchRemoteLocationDTO(
      cityLatitude: cityLatitude,
      cityLongitude: cityLongitude,
      locationAddress: locationAddress,
      locationName: locationName,
      locationCountry: locationCountry,
      locationCity: locationCity,
    );

    return locationDto;
  }

  final double? cityLatitude;
  final double? cityLongitude;
  final String locationAddress;
  final String locationName;
  final String locationCountry;
  final String locationCity;
}
