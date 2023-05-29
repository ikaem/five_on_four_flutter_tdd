import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/match_briefs_list.dart';
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
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: "My next match",
                ),
                Tab(
                  text: "My joined matches",
                ),
                Tab(
                  text: "My match invitations",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      PlayerBriefOverview(),
                      SizedBox(
                        height: SpacingConstants.small,
                      ),
                      MatchInfoBriefOverview(
                        matchInfo: initialData.nextMatch,
                        noMatchInfoLabel: "No upcoming matches",
                      ),
                    ],
                  ),
                  MatchBriefsList(
                    matches: initialData.joinedMatches,
                    title: "",
                  ),
                  MatchBriefsList(
                    matches: initialData.invitedMatches,
                    title: "",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
