import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_filters_container.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_search/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/match_briefs_list.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchesSearch extends ConsumerWidget {
  const MatchesSearch({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final AsyncValue<List<MatchModel>> matchesSearchState =
        ref.watch(matchesSearchAppControllerProvider);

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.all(SpacingConstants.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(
              // TODO this should be done better, globally somehow
              color: ColorConstants.grey1,
            ),
            onChanged: ref
                .read(matchesSearchAppControllerProvider.notifier)
                .onChangeSearchTerm,
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
          SearchFiltersContainer(textTheme: textTheme),
          SizedBox(
            height: SpacingConstants.mediumLarge,
          ),
          matchesSearchState.when(
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
              return Expanded(
                child: MatchBriefsList(
                  matches: data,
                  title: Text(
                    "Found matches: ",
                    style: TextStyle(
                      color: ColorConstants.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
