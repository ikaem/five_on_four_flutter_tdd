import 'dart:math';

import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';

@freezed
class MatchParticipantRemoteDTO with _$MatchParticipantRemoteDTO {
  const factory MatchParticipantRemoteDTO({
    required String id,
    required String playerId,
    required String matchId,
    required String nickname,
    required String status,
    required int createdAt,
    required int? expiresAt,
  }) = _MatchParticipantRemoteDTO;

  // TODO only needed for dev
  factory MatchParticipantRemoteDTO.fromMatchParticipantInvitationValue({
    required MatchParticipationValue invitationValue,
    required String matchId,
    // TODO make status an enum
    required String status,
  }) {
    final DateTime nowDate = DateTime.now();
    final int createdAt = nowDate.millisecondsSinceEpoch;
    final int expiresAt = nowDate.add(Duration(days: 7)).millisecondsSinceEpoch;
    final String id = Random().nextInt(1000).toString();

    final MatchParticipantRemoteDTO dto = MatchParticipantRemoteDTO(
      id: id,
      playerId: invitationValue.playerId,
      matchId: matchId,
      nickname: invitationValue.nickname,
      status: status,
      createdAt: createdAt,
      expiresAt: expiresAt,
    );

    return dto;
  }
}
