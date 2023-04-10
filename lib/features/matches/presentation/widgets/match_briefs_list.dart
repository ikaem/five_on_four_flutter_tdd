import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';

class MatchBriefsList extends StatelessWidget {
  const MatchBriefsList({
    super.key,
    required this.matches,
  });

  final List<MatchModel> matches;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final MatchModel match = matches[index];

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: SpacingConstants.medium / 2,
          ),
          child: MatchBriefCard(
            match: match,
          ),
        );
      },
    );
  }
}
