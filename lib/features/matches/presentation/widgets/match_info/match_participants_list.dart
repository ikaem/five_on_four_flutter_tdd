import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_participant_brief_card.dart';
import 'package:flutter/material.dart';

class MatchParticipantsList extends StatelessWidget {
  const MatchParticipantsList({
    super.key,
    required this.participants,
  });

  final List<MatchParticipantModel> participants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: participants.length,
      itemBuilder: (context, index) {
        final MatchParticipantModel matchParticipant = participants[index];

        return MatchParticipantBriefCard(
          matchParticipant: matchParticipant,
        );
      },
    );
  }
}
