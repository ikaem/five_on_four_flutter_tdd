import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/utils/extensions/match_model_extension.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/presentation/widgets/weather_brief_info.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';

class MatchInfoVenueOverview extends StatelessWidget {
  const MatchInfoVenueOverview({
    super.key,
    required this.weather,
    required this.match,
  });

// TODO all of this we need - we will have this later
  // final LocationModel location;
  // final WeatherModel weather;
  // TODO add extensions on datetime to format it as we need it here
  // final DateTime startsAt;

  final WeatherModel? weather;
  final MatchModel match;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location:",
                style: textTheme.titleSmall!.copyWith(
                  color: ColorConstants.yellow,
                ),
              ),
              SizedBox(
                height: SpacingConstants.medium,
              ),
              Text(
                match.location.locationName,
                style: textTheme.bodyMedium!.copyWith(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                match.location.locationAddress,
                style: textTheme.bodySmall!.copyWith(
                  color: ColorConstants.white,
                ),
              ),
              Text(
                "${match.location.locationCity}, ${match.location.locationCountry}",
                style: textTheme.bodySmall!.copyWith(
                  color: ColorConstants.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date:",
                style: textTheme.titleSmall!.copyWith(
                  color: ColorConstants.yellow,
                ),
              ),
              SizedBox(
                height: SpacingConstants.medium,
              ),
              Text(
                match.formattedMatchDate,
                style: textTheme.bodyMedium!.copyWith(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Column(
            children: [
              Text("Weather:"),
              SizedBox(
                height: SpacingConstants.medium,
              ),
              WeatherBriefInfo(weather: weather),
              // Row(
              //   children: [
              //     Text("Sunny"),
              //     Icon(
              //       Icons.sunny,
              //       size: FontSizeConstants.xxxLarge,
              //       color: ColorConstants.white,
              //     ),
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}
