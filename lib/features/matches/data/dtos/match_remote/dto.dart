import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_exceptions.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "dto.freezed.dart";

@freezed
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO(
      {required String id,
      required String name,
      required int date,
      required List<MatchParticipantRemoteDTO> participants,
      required}) = _MatchRemoteDTO;

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

    final MatchRemoteDTO matchDto = MatchRemoteDTO(
      id: matchDoc.id,
      name: matchData['name'] as String,
      date: matchDate,
      participants: participantsDtos,
    );

    return matchDto;
  }
}
