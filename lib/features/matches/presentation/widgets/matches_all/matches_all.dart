import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_all/providers/provider.dart';

import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_search/match_briefs_list.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchesAll extends ConsumerWidget {
  const MatchesAll({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final AsyncValue<List<MatchModel>> matchesInRegionState =
        ref.watch(matchesAllAppControllerProvider);

    return Padding(
      padding: EdgeInsets.all(SpacingConstants.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.yellow,
              borderRadius: BorderRadius.circular(
                DimensionsConstants.d10,
              ),
            ),
          ),
          SizedBox(
            height: SpacingConstants.mediumLarge,
          ),
          matchesInRegionState.when(
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
