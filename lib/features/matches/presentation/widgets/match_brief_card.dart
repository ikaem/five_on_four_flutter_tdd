import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/icon_with_text.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
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
  });

  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRoutes.matchInfoScreenRouteValue.name,
          pathParameters: {
            AppConstants.idKey: match.id,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(SpacingConstants.medium),
        decoration: BoxDecoration(
          color: ColorConstants.greenDark,
          borderRadius: BorderRadius.circular(
            DimensionsConstants.d10,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              match.name,
              style: textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.white,
              ),
            ),
            SizedBox(
              height: SpacingConstants.medium,
            ),
            IconWithText(
              icon: Icons.location_on,
              iconColor: ColorConstants.yellow,
              iconSize: FontSizeConstants.medium,
              text: match.location.locationName,
              textStyle: textTheme.titleSmall!.copyWith(
                color: ColorConstants.grey1,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SpacingConstants.xSmall,
            ),
            IconWithText(
              icon: Icons.group,
              iconColor: ColorConstants.yellow,
              iconSize: FontSizeConstants.medium,
              text: '${match.joinedParticipants.length} player(s) arriving',
              textStyle: textTheme.titleSmall!.copyWith(
                color: ColorConstants.grey1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
