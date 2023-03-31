import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_participant_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class MatchParticipantModel with _$MatchParticipantModel {
  const factory MatchParticipantModel({
    required String id,
    required String userId,
    required String nickname,
    required MatchParticipantStatus status,
    required int createdAt,
    required int? invitationExpirationTime,
  }) = _MatchParticipantModel;

  factory MatchParticipantModel.fromRemoteDTO(MatchParticipantRemoteDTO dto) {
    final MatchParticipantStatus status =
        MatchParticipantStatus.values.firstWhere(
      (status) {
        // TODO test
        return status.name == dto.status;
      },
      orElse: () => MatchParticipantStatus.unknown,
    );

    final MatchParticipantModel participant = MatchParticipantModel(
      id: dto.id,
      userId: dto.id,
      nickname: dto.nickname,
      status: status,
      createdAt: dto.createdAt,
      invitationExpirationTime: dto.expiresAt,
    );

    return participant;
  }
}
