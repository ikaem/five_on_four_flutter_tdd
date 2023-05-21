import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/exceptions/match_participantion_exceptions.dart';
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

  factory MatchParticipantRemoteDTO.fromFirestoreDoc({
    required DocumentSnapshot<Map<String, dynamic>> doc,
  }) {
    final String participationId = doc.id;
    final Map<String, dynamic>? participationData = doc.data();

    if (participationData == null) {
      throw MatchParticipationExceptionInvalidRemoteData(
        message: "Match participation data is null: $participationId",
      );
    }

    final MatchParticipantStatus participationStatus =
        MatchParticipantStatus.values.firstWhere(
      (value) => value.name == participationData['status'].toString(),
      orElse: () => MatchParticipantStatus.unknown,
    );

    final Timestamp createdAtTimestamp =
        participationData['createdAt'] as Timestamp;
    final Timestamp? invitationExpiresAtTimestamp =
        participationData['expiresAt'] as Timestamp?;

    // converting to int so can store to isar easier
    final int createdAtDate = createdAtTimestamp.millisecondsSinceEpoch;
    final int? expirationDate = invitationExpiresAtTimestamp == null
        ? null
        : invitationExpiresAtTimestamp.millisecondsSinceEpoch;
    final MatchParticipantRemoteDTO dto = MatchParticipantRemoteDTO(
      id: doc.id,
      playerId: participationData['playerId'].toString(),
      matchId: participationData['matchId'].toString(),
      nickname: participationData['nickname'].toString(),
      status: participationStatus.name,
      createdAt: createdAtDate,
      expiresAt: expirationDate,
    );

    return dto;
  }

  // TODO only needed for dev
  factory MatchParticipantRemoteDTO.fromMatchParticipantInvitationValue({
    required MatchParticipationValue invitationValue,
    required String matchId,
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
