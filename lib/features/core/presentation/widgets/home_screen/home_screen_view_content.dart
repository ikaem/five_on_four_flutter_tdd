import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/home_screen/home_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/match_briefs_list.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class HomeScreenViewContent extends StatelessWidget {
  const HomeScreenViewContent({
    super.key,
    required this.initialData,
    // required this.playerNickname,
  });

  final InitialDataValue initialData;
  // final String playerNickname;

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
              labelColor: ColorConstants.grey1,
              isScrollable: true,
              tabs: [
                Tab(
                  text: "Overview",
                ),
                Tab(
                  text: "My joined matches",
                ),
                Tab(
                  text: "My match invitations",
                ),
              ],
            ),
            SizedBox(
              height: SpacingConstants.mediumLarge,
            ),
            Flexible(
              child: TabBarView(
                children: [
                  HomeOverview(
                    initialData: initialData,
                  ),
                  MatchBriefsList(
                    matches: initialData.joinedMatches,
                  ),
                  MatchBriefsList(
                    matches: initialData.invitedMatches,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
