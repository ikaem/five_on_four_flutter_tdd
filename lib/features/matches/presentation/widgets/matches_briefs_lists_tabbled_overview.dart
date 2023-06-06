import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/match_briefs_list.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';

class MatchesBriefsListsTabbedOverview extends StatelessWidget {
  const MatchesBriefsListsTabbedOverview({
    super.key,
    required this.matchesListsMap,
  });

  final Map<String, List<MatchModel>> matchesListsMap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final List<String> tabNames = matchesListsMap.keys.toList();
    final List<List<MatchModel>> matchesLists = matchesListsMap.values.toList();

    return DefaultTabController(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
              labelStyle:
                  textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
              labelColor: ColorConstants.black,
              unselectedLabelColor: ColorConstants.white,
              indicator: BoxDecoration(
                color: ColorConstants.yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    DimensionsConstants.d10,
                  ),
                  topRight: Radius.circular(
                    DimensionsConstants.d10,
                  ),
                ),
              ),
              tabs: tabNames.map(
                (tabName) {
                  return Tab(
                    text: tabName,
                  );
                },
              ).toList()),
          Expanded(
            child: Container(
              // height: 200,
              padding: EdgeInsets.all(
                SpacingConstants.medium,
              ),
              decoration: BoxDecoration(
                color: ColorConstants.yellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    DimensionsConstants.d10,
                  ),
                  bottomRight: Radius.circular(
                    DimensionsConstants.d10,
                  ),
                ),
              ),
              child: TabBarView(
                children: matchesLists.map((ml) {
                  return MatchBriefsList(
                    matches: ml,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      length: 2,
    );
  }
}
