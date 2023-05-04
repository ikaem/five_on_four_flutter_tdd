import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_filters_container.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_search/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/search_results_matches.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchesScreen extends ConsumerWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final AsyncValue<List<MatchModel>> matchesSearchValue =
        ref.watch(matchesSearchControllerProvider);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      key: const Key(WidgetKeysConstants.matchesScreenScaffoldKey),
      appBar: AppBar(
        title: Text("Matches"),
      ),
      // TODO wrapping this in single child scroll view would prevent overdflow - but i dont want that

      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO same widget exists on the palyers earch screen
            TextField(
              onChanged: (value) {
                ref
                    .read(matchesSearchControllerProvider.notifier)
                    .onChangeSearchTerm(value);
              },
              decoration: InputDecoration(
                labelText: "Search matches",
                labelStyle: TextStyle(color: ColorConstants.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SpacingConstants.small,
            ),
            SearchFiltersContainer(themeText: themeText),
            SizedBox(
              height: SpacingConstants.mediumLarge,
            ),
            matchesSearchValue.when(
              error: (error, stackTrace) {
                return Center(
                  child: Text("There was an issue searching matches"),
                );
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              data: (data) {
                return SearchResultsMatches(
                  matches: data,
                  // onTapPlayerResult: _onTapPlayerResult,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
