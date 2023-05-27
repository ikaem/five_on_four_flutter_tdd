import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class MatchParticipationValue with _$MatchParticipationValue {
  const factory MatchParticipationValue({
    required String playerId,
    required String nickname,
    required MatchParticipantStatus status,
  }) = _MatchParticipationValue;

  factory MatchParticipationValue.fromPlayerModel({
    required PlayerModel player,
    required MatchParticipantStatus status,
  }) {
    final MatchParticipationValue value = MatchParticipationValue(
        playerId: player.id, nickname: player.nickname, status: status);

    return value;
  }
}

// TODO move to extensions
extension MatchParticipationValueExtension on MatchParticipationValue {
  Map<String, dynamic> toInvitationNotificationDataMap({
    required String matchId,
    required String matchName,
  }) {
    final Map<String, dynamic> map = {
      "playerId": playerId,
      "matchId": matchId,
      "matchName": matchName,
    };

    return map;
  }

  //
  Map<String, dynamic> toFirestoreMap() {
    final Timestamp? expiresAt = status == MatchParticipantStatus.invited
        ? Timestamp.fromDate(
            DateTime.now().add(
              // TODO move this to constants
              Duration(days: 7),
            ),
          )
        : null;

    return {
      'playerId': playerId,
      'nickname': nickname,
      "status": status.name,
      // TODO we cannot have match id here because we dont have it yet when we create match
      "createdAt": Timestamp.fromDate(DateTime.now()),
      "expiresAt": expiresAt,
    };
  }
}
