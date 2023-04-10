import 'package:five_on_four_flutter_tdd/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_briefs_lists_tabbled_overview.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/player_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class HomeScreenInitialDataContent extends StatelessWidget {
  const HomeScreenInitialDataContent({
    super.key,
    required this.initialData,
  });

  final InitialDataValue initialData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SpacingConstants.small),
      child: Column(
        children: [
          PlayerBriefOverview(),
          SizedBox(
            height: SpacingConstants.xxLarge,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: MatchInfoBriefOverview(
                    matchInfo: initialData.nextMatch,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: SpacingConstants.xxLarge,
                  ),
                ),
                SliverFillRemaining(
                  child: MatchesBriefsListsTabbedOverview(
                    matchesListsMap: _initialDataToMatchesListsMap(
                      initialData,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, List<MatchModel>> _initialDataToMatchesListsMap(
    InitialDataValue initialDataValue,
  ) {
// here, i actually just need to loop over data

    final List<MatchModel> upcomingMatches = initialData.joinedMatches;
    final List<MatchModel> invitedMatches = initialData.invitedMatches;

    final Map<String, List<MatchModel>> map = {
      "Upcoming matches": upcomingMatches,
      "Invited matches": invitedMatches,
    };

    return map;
  }
}
