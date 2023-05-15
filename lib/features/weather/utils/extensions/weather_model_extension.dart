import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:flutter/material.dart';

extension WeatherModelExtension on WeatherModel {
  IconData getWeatherIcon() {
    switch (weatherDescription) {
      case 'Sunny':
        {
          return Icons.wb_sunny;
        }
      case 'Clear':
        {
          return Icons.nights_stay;
        }
      case 'Partly cloudy':
        {
          return Icons.cloud_queue;
        }
      case 'Cloudy':
        {
          return Icons.cloud;
        }
      case 'Overcast':
        {
          return Icons.cloud_off;
        }
      case 'Mist':
        {
          return Icons.cloud_queue;
        }
      case 'Patchy rain possible':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
        {
          return Icons.wb_cloudy;
        }
      case 'Thundery outbreaks possible':
        {
          return Icons.flash_on;
        }
      case 'Blowing snow':
      case 'Blizzard':
      case 'Fog':
      case 'Freezing fog':
        {
          return Icons.cloud_off;
        }
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
      case 'Light sleet':
      case 'Moderate or heavy sleet':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Ice pellets':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
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
      case 'Sunny':
        {
          return 'Sunny';
        }
      case 'Clear':
        {
          return 'Clear';
        }
      case 'Partly cloudy':
        {
          return 'Partly cloudy';
        }
      case 'Cloudy':
        {
          return 'Cloudy';
        }
      case 'Overcast':
        {
          return 'Overcast';
        }
      case 'Mist':
        {
          return 'Mist';
        }
      case 'Patchy rain possible':
        {
          return 'Patchy rain possible';
        }
      case 'Patchy snow possible':
        {
          return 'Patchy snow possible';
        }
      case 'Patchy sleet possible':
        {
          return 'Patchy sleet possible';
        }
      case 'Patchy freezing drizzle possible':
        {
          return 'Patchy freezing drizzle possible';
        }
      case 'Thundery outbreaks possible':
        {
          return 'Thundery outbreaks possible';
        }
      case 'Blowing snow':
        {
          return 'Blowing snow';
        }
      case 'Blizzard':
        {
          return 'Blizzard';
        }
      case 'Fog':
        {
          return 'Fog';
        }
      case 'Freezing fog':
        {
          return 'Freezing fog';
        }
      case 'Patchy light drizzle':
        {
          return 'Patchy light drizzle';
        }
      case 'Light drizzle':
        {
          return 'Light drizzle';
        }
      case 'Freezing drizzle':
        {
          return 'Freezing drizzle';
        }
      case 'Heavy freezing drizzle':
        {
          return 'Heavy freezing drizzle';
        }
      case 'Patchy light rain':
        {
          return 'Patchy light rain';
        }
      case 'Light rain':
        {
          return 'Light rain';
        }
      case 'Moderate rain at times':
        {
          return 'Moderate rain at times';
        }
      case 'Moderate rain':
        {
          return 'Moderate rain';
        }
      case 'Heavy rain at times':
        {
          return 'Heavy rain at times';
        }
      case 'Heavy rain':
        {
          return 'Heavy rain';
        }
      case 'Light freezing rain':
        {
          return 'Light freezing rain';
        }
      case 'Moderate or heavy freezing rain':
        {
          return 'Moderate or heavy freezing rain';
        }
      case 'Light sleet':
        {
          return 'Light sleet';
        }
      case 'Moderate or heavy sleet':
        {
          return 'Moderate or heavy sleet';
        }
      case 'Patchy light snow':
        {
          return 'Patchy light snow';
        }
      case 'Light snow':
        {
          return 'Light snow';
        }
      case 'Patchy moderate snow':
        {
          return 'Patchy moderate snow';
        }
      case 'Moderate snow':
        {
          return 'Moderate snow';
        }
      case 'Patchy heavy snow':
        {
          return 'Patchy heavy snow';
        }
      case 'Heavy snow':
        {
          return 'Heavy snow';
        }
      case 'Ice pellets':
        {
          return 'Ice pellets';
        }
      case 'Light rain shower':
        {
          return 'Light rain shower';
        }
      case 'Moderate or heavy rain shower':
        {
          return 'Moderate or heavy rain shower';
        }
      case 'Torrential rain shower':
        {
          return 'Torrential rain shower';
        }
      case 'Light sleet showers':
        {
          return 'Light sleet showers';
        }
      case 'Moderate or heavy sleet showers':
        {
          return 'Moderate or heavy sleet showers';
        }
      case 'Light snow showers':
        {
          return 'Light snow showers';
        }
      case 'Moderate or heavy snow showers':
        {
          return 'Moderate or heavy snow showers';
        }
      case 'Light showers of ice pellets':
        {
          return 'Light showers of ice pellets';
        }
      case 'Moderate or heavy showers of ice pellets':
        {
          return 'Moderate or heavy showers of ice pellets';
        }
      case 'Patchy light rain with thunder':
        {
          return 'Patchy light rain with thunder';
        }
      case 'Moderate or heavy rain with thunder':
        {
          return 'Moderate or heavy rain with thunder';
        }
      case 'Patchy light snow with thunder':
        {
          return 'Patchy light snow with thunder';
        }
      case 'Moderate or heavy snow with thunder':
        {
          return 'Moderate or heavy snow with thunder';
        }
      default:
        {
          return 'Unknown weather';
        }
    }
  }
}
