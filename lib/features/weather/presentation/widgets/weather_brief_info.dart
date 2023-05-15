import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/extensions/weather_model_extension.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';

class WeatherBriefInfo extends StatelessWidget {
  const WeatherBriefInfo({
    super.key,
    required this.weather,
  });

  final WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    final WeatherModel? currentWeather = weather;

    if (currentWeather == null) return SizedBox.shrink();

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Container(
      margin: EdgeInsets.all(SpacingConstants.medium),
      width: DimensionsConstants.d60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            currentWeather.getWeatherIcon(),
            size: FontSizeConstants.xxxLarge,
            color: ColorConstants.yellow,
          ),
          SizedBox(
            height: SpacingConstants.small,
          ),
          Text(
            currentWeather.getWeatherDescription(),
            textAlign: TextAlign.center,
            style: textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstants.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
