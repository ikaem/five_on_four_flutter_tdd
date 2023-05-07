import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:flutter/material.dart';

extension WeatherModelExtension on WeatherModel {
  IconData getWeatherIcon() {
    switch (weatherDescription) {
      // TODO this should also eventually check for enum
      case 'Light rain':
        {
          return Icons.grain;
        }
      default:
        {
          return Icons.help_outline;
        }
    }
  }

  String getWeatherDescription() {
    switch (weatherDescription) {
      // TODO this should check for enum eventually
      case 'Light rain':
        {
          return 'Light rain';
        }
      default:
        {
          return 'Unknown weather';
        }
    }
  }
}
