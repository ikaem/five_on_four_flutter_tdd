import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/presentation/widgets/weather_brief_info.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MatchInfoBriefOverview extends StatelessWidget {
  const MatchInfoBriefOverview({
    super.key,
    required this.matchInfo,
    required this.noMatchInfoLabel,
  });

  final MatchInfoModel? matchInfo;
  final String noMatchInfoLabel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final MatchInfoModel? currentMatchInfo = matchInfo;

    if (currentMatchInfo == null) {
      return Center(
        child: Text(
          noMatchInfoLabel,
          style: textTheme.titleSmall!.copyWith(
            color: ColorConstants.yellow,
          ),
        ),
      );
    }

    final MatchModel match = currentMatchInfo.match;
    final WeatherModel? weather = currentMatchInfo.weather;

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
        decoration: BoxDecoration(
          color: ColorConstants.greenDark,
          borderRadius: BorderRadius.circular(DimensionsConstants.d10),
        ),
        padding: EdgeInsets.all(SpacingConstants.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My next match',
              style: textTheme.titleSmall!.copyWith(
                color: ColorConstants.yellow,
              ),
            ),
            SizedBox(
              height: SpacingConstants.medium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        match.name,
                        style: textTheme.bodyMedium!.copyWith(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: SpacingConstants.medium,
                      ),
                      Text(
                        // TODO this needs to be properly formatted
                        match.date.toIso8601String(),
                        style: textTheme.bodySmall!.copyWith(
                          color: ColorConstants.white,
                        ),
                      ),
                      Text(
                        match.location.locationName,
                        style: textTheme.bodySmall!.copyWith(
                          color: ColorConstants.white,
                        ),
                      ),
                      SizedBox(
                        height: SpacingConstants.medium,
                      ),
                      Text(
                        '${match.joinedParticipants.length} player(s) arriving',
                        style: textTheme.bodySmall!.copyWith(
                          color: ColorConstants.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // TODO make this a separate widget in weather feature
                if (weather != null)
                  WeatherBriefInfo(
                    weather: weather,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
