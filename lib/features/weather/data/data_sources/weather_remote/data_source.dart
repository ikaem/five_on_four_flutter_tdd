import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';

abstract class WeatherRemoteDataSource {
  const WeatherRemoteDataSource();

  Future<WeatherForecastRemoteDTO> getWeatherForCoordinatesAndTime({
    required double longitude,
    required double latitude,
    required DateTime date,
  });
}
