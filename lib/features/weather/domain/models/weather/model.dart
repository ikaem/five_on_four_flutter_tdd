import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math';

part 'model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String locationName,
    required double temperatureCelsius,
    required String weatherDescription,
  }) = _WeatherModel;

  factory WeatherModel.fromWeathaerForecastRemoteDTO(
    WeatherForecastRemoteDTO dto,
  ) {
    final String locationName = dto.location.name;

    final WeatherHourRemoteDTO hourForecast =
        dto.forecast.forecastday.first.hour.first;
    final double temperatureCelsius = hourForecast.tempC;
    final String weatherDescription = hourForecast.condition.text;

    final WeatherModel model = WeatherModel(
      locationName: locationName,
      temperatureCelsius: temperatureCelsius,
      weatherDescription: weatherDescription,
    );

    return model;
  }

  factory WeatherModel.random() {
    final Random rng = Random();

    final String locationName = "Random City";
    final double temperatureCelsius = rng.nextDouble() * 30.0 - 10.0;
    final String weatherDescription = "Random weather";

    final WeatherModel model = WeatherModel(
      locationName: locationName,
      temperatureCelsius: temperatureCelsius,
      weatherDescription: weatherDescription,
    );

    return model;
  }
}
