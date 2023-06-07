import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class MatchBriefsList extends StatelessWidget {
  const MatchBriefsList({
    super.key,
    required this.matches,
    this.title,
  });

  final List<MatchModel> matches;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final Widget? listTitle = title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (listTitle != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: SpacingConstants.small,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                listTitle,
                Divider(
                  color: ColorConstants.grey3,
                ),
              ],
            ),
          ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: SpacingConstants.small,
              );
            },
            itemBuilder: (context, index) {
              final MatchModel match = matches[index];

              return MatchBriefCard(
                match: match,
              );
            },
            itemCount: matches.length,
          ),
        ),
      ],
    );
  }
}
