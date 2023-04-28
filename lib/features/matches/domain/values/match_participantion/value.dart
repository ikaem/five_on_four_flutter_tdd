import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:flutter/material.dart';

// TODO use freezed for this
@immutable
class MatchParticipationValue {
  const MatchParticipationValue({
    required this.playerId,
    required this.nickname,
  });

  // TODO should this be a model isntead?
  // TOOD rename this to MatchParticipationValue, to be reused for invitaitons and joining
  factory MatchParticipationValue.fromPlayerModel(PlayerModel player) {
    final MatchParticipationValue value = MatchParticipationValue(
      playerId: player.id,
      nickname: player.nickname,
    );

    return value;
  }

  final String playerId;
  final String nickname;
}
