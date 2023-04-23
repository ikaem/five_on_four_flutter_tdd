import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:flutter/material.dart';

// TODO use freezed for this
@immutable
class MatchParticipantInvitationValue {
  const MatchParticipantInvitationValue({
    required this.playerId,
    required this.nickname,
  });

  // TODO should this be a model isntead?
  factory MatchParticipantInvitationValue.fromPlayerModel(PlayerModel player) {
    final MatchParticipantInvitationValue value =
        MatchParticipantInvitationValue(
      playerId: player.id,
      nickname: player.nickname,
    );

    return value;
  }

  final String playerId;
  final String nickname;
}
