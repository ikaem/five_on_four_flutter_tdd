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
}
