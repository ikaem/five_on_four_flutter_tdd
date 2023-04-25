import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/new_match/value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "dto.freezed.dart";

@freezed
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO({
    required String id,
    required String name,
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
// TODO match will need to have organizer field on it
// TODO THIS WILL need to be filtered elsewhere to add player to match if they are joining
      final String participantStatus =
          matchValue.isOrganizerJoined && e.playerId == organizerId
              ? "confirmed"
              : "joined";

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
      name: matchValue.matchName,
      participants: [],
    );

    return dto;
  }
}
