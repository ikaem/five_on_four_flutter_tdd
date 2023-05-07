import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class MatchParticipationValue with _$MatchParticipationValue {
  const factory MatchParticipationValue({
    required String playerId,
    required String nickname,
  }) = _MatchParticipationValue;

  factory MatchParticipationValue.fromPlayerModel(PlayerModel player) {
    final MatchParticipationValue value = MatchParticipationValue(
      playerId: player.id,
      nickname: player.nickname,
    );

    return value;
  }
}
