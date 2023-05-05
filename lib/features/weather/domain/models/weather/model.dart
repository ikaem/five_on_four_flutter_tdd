import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math';

part 'model.freezed.dart';

@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String locationName,
    required double temperatureCelsius,
    // TODO make enum eventually
    required String weatherDescription,
  }) = _WeatherModel;

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
