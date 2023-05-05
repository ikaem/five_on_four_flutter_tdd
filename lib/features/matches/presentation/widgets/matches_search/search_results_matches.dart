import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class SearchResultsMatches extends StatelessWidget {
  const SearchResultsMatches({
    super.key,
    required this.matches,
    // required this.onTapMatchResult,
  });

  final List<MatchModel> matches;
  // TODO this is not needed yet
  // final OnTapMatchResult onTapMatchResult;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

// TODO this should be probably using players search resultls as well, to make sure dry
    return Container(
      padding: EdgeInsets.all(
        SpacingConstants.small,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(
          DimensionsConstants.d10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Results",
            style: themeText.titleSmall,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Expanded(
            child: ListView.separated(
              // shrinkWrap: true,
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
      ),
    );
  }
}
