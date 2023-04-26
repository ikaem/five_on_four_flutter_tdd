import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/extensions/weather_model_extension.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MatchInfoBriefOverview extends StatelessWidget {
  const MatchInfoBriefOverview({
    super.key,
    required this.matchInfo,
  });

  final MatchInfoModel matchInfo;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final MatchModel match = matchInfo.match;
    final WeatherModel weather = matchInfo.weather;

    return GestureDetector(
      onTap: () {
        print("tapped on the stuff");
        // TODO using push named, because path has that :d in it- try to normalize that somehow
        context.pushNamed(
          AppRoutes.matchInfoScreenRouteValue.name,
          params: {
            // TODO should use this id as constnats somewhere
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
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        '23 January 2023, 18:00',
                        style: textTheme.bodySmall!.copyWith(
                          color: ColorConstants.white,
                        ),
                      ),
                      Text(
                        'Come location here',
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
                Container(
                  margin: EdgeInsets.all(SpacingConstants.medium),
                  width: DimensionsConstants.d60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        weather.getWeatherIcon(),
                        size: FontSizeConstants.xxxLarge,
                        color: ColorConstants.yellow,
                      ),
                      SizedBox(
                        height: SpacingConstants.small,
                      ),
                      Text(
                        weather.getWeatherDescription(),
                        textAlign: TextAlign.center,
                        style: textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
