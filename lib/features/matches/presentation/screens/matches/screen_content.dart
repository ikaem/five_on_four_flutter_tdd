import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_all/matches_all.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/matches_search.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';

class MatchesScreenContent extends StatelessWidget {
  const MatchesScreenContent({
    super.key,
    // required this.matchesSearchState,
    // required this.onChangeSearchTerm,
  });

  // final AsyncValue<List<MatchModel>> matchesSearchState;
  // final ValueSetter<String> onChangeSearchTerm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SpacingConstants.small),
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: "Matches in my region",
                ),
                Tab(
                  text: "Matches search",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                MatchesAll(),
                MatchesSearch(),
              ]),
            )
          ],
        ),
      ),
    );

    // TODO test
    // final ThemeData theme = Theme.of(context);
    // final TextTheme textTheme = theme.textTheme;

    // return Padding(
    //   padding: EdgeInsets.all(SpacingConstants.small),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       TextField(
    //         onChanged: onChangeSearchTerm,
    //         decoration: InputDecoration(
    //           labelText: "Search matches",
    //           labelStyle: TextStyle(color: ColorConstants.white),
    //           enabledBorder: UnderlineInputBorder(
    //             borderSide: BorderSide(
    //               color: ColorConstants.white,
    //             ),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: SpacingConstants.small,
    //       ),
    //       SearchFiltersContainer(textTheme: textTheme),
    //       SizedBox(
    //         height: SpacingConstants.mediumLarge,
    //       ),
    //       matchesSearchState.when(
    //         error: (error, stackTrace) {
    //           return Center(
    //             child: Text("There was an issue searching matches"),
    //           );
    //         },
    //         loading: () {
    //           return Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         },
    //         data: (data) {
    //           return Expanded(
    //             child: SearchResultsMatches(
    //               matches: data,
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
