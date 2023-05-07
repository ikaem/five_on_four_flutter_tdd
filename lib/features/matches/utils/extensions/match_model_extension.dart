import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';

extension MatchModelExtension on MatchModel {
  static List<MatchParticipantModel> filterMatchParticipantsByStatus({
    required MatchParticipantStatus status,
    required List<MatchParticipantModel> participants,
  }) {
    final List<MatchParticipantModel> filteredParticipants =
        participants.where((p) => p.status == status).toList();

    return filteredParticipants;
  }

  /* TODO for readability */
  List<MatchParticipantModel> get allParticipants => <MatchParticipantModel>[]
    ..addAll(joinedParticipants)
    ..addAll(invitedParticipants);
}
