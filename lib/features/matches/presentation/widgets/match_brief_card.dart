import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef OnTapMatchResult = void Function({
  required BuildContext context,
  required MatchModel matchModel,
});

class MatchBriefCard extends StatelessWidget {
  const MatchBriefCard({
    super.key,
    required this.match,
    // TODO add this later if needed
    // required this.onTapMatchResult,
    // required this.tappableIcon,
  });

// TODO possibly, this should get match brief, and not full on match
  final MatchModel match;
  // final OnTapMatchResult onTapMatchResult;
  // final Icon tappableIcon;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorsTheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoutes.matchInfoScreenRouteValue.name,
          params: {
            // TODO should use this id as constnats somewhere
            AppConstants.idKey: match.id,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(SpacingConstants.medium),
        // TODO this should probably use theme as well because of toggling dark and light theme
        // color: ColorConstants.greenLight,

        decoration: BoxDecoration(
            color: ColorConstants.greenLight,
            borderRadius: BorderRadius.circular(
              DimensionsConstants.d10,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              match.name,
              style: textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.white,
              ),
            ),
            SizedBox(
              height: SpacingConstants.xSmall,
            ),
            Text(
              "Some data here",
              style: textTheme.labelMedium!.copyWith(
                color: ColorConstants.grey,
              ),
            ),
            SizedBox(
              height: SpacingConstants.xSmall,
            ),
            Text(
              "Players arriving: ${match.joinedParticipants.length}",
              style: textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
