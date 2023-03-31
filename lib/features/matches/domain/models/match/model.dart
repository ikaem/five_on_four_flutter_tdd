import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/extensions/match_model_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
class MatchModel with _$MatchModel {
  const factory MatchModel({
    required String id,
    required String name,
    required List<MatchParticipantModel> joinedParticipants,
    required List<MatchParticipantModel> invitedParticipants,
  }) = _MatchModel;

  factory MatchModel.fromRemoteDto(MatchRemoteDTO remoteDto) {
    final List<MatchParticipantModel> allParticipants = remoteDto.participants
        .map((p) => MatchParticipantModel.fromRemoteDTO(p))
        .toList();

    final List<MatchParticipantModel> matchJoinedParticipants =
        MatchModelExtension.filterMatchParticipantsByStatus(
      status: MatchParticipantStatus.joined,
      participants: allParticipants,
    );

    final List<MatchParticipantModel> matchInvitedParticipants =
        MatchModelExtension.filterMatchParticipantsByStatus(
      status: MatchParticipantStatus.invited,
      participants: allParticipants,
    );

    final MatchModel match = MatchModel(
      id: remoteDto.id,
      name: remoteDto.name,
      joinedParticipants: matchJoinedParticipants,
      invitedParticipants: matchInvitedParticipants,
    );

    return match;
  }

  factory MatchModel.fromRandom() {
    final String id = '1';
    final String name = 'Some random match name';
    final List<MatchParticipantModel> joinedParticipants = [];
    final List<MatchParticipantModel> invitedParticipants = [];

    return MatchModel(
      id: id,
      name: name,
      joinedParticipants: joinedParticipants,
      invitedParticipants: invitedParticipants,
    );
  }
}
