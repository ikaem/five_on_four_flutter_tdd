import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';

abstract class WeatherRepository {
  const WeatherRepository();

  Future<WeatherModel?> getWeatherForCoordinates({
    required double? longitude,
    required double? latitude,
  });
}
