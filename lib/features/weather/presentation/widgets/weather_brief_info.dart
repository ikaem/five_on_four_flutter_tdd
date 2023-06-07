import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/icon_with_text.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/extensions/weather_model_extension.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
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

    return IconWithText(
      icon: currentWeather.normalizedWeatherIcon,
      iconColor: ColorConstants.yellow,
      text: currentWeather.normalizedWeatherDescription,
      textStyle: textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.bold,
        color: ColorConstants.grey1,
      ),
    );
  }
}
