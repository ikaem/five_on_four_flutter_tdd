import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "dto.freezed.dart";

@freezed
class MatchRemoteDTO with _$MatchRemoteDTO {
  const factory MatchRemoteDTO({
    required String id,
    required String name,
    required List<MatchParticipantRemoteDTO> participants,
  }) = _MatchRemoteDTO;
}
