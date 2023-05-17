import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_in_region/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchesInRegion extends ConsumerWidget {
  const MatchesInRegion({super.key});

  // TODO this will need its own controller as well

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final AsyncValue<List<MatchModel>> matchesSearchState =
        ref.watch(matchesInRegionAppControllerProvider);

    return Padding(
      padding: EdgeInsets.all(SpacingConstants.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SpacingConstants.small,
          ),
          Text.rich(TextSpan(
            style: TextStyle(
              color: ColorConstants.white,
            ),
            children: [
              TextSpan(
                text: "Find in radius: ",
              ),
              // TODO this will be wrapped in stream builder for the currently selected value
              TextSpan(
                text: "10 km",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )

              // "Find in radius: 60 km",
              // style: TextStyle(color: ColorConstants.white),
              ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          // TODO this also needs to be wrapped in a stream builder
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.yellow,
              borderRadius: BorderRadius.circular(
                DimensionsConstants.d10,
              ),
            ),
            child: Slider(
              min: 0,
              max: 100,
              value: 10,
              onChanged: (value) {},
              activeColor: ColorConstants.red,
              inactiveColor: ColorConstants.white,
            ),
          ),
        ],
      ),
    );
  }
}
