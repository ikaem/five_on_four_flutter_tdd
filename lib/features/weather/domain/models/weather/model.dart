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

  // factory WeatherModel.fromRemoteDTO(WeatherRemoteDTO dto) {
  //   final String locationName = dto.location.name;
  //   final double temperatureCelsius = dto.current.tempC;
  //   final String weatherDescription = dto.current.condition.text;

  //   final WeatherModel model = WeatherModel(
  //     locationName: locationName,
  //     temperatureCelsius: temperatureCelsius,
  //     weatherDescription: weatherDescription,
  //   );

  //   return model;
  // }

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

// TODO move to extensions

