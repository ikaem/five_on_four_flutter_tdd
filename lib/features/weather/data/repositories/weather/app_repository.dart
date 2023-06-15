import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/repositories/weather/repository_mixin.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';

class WeatherAppRepository extends WeatherRepository
    with WeatherRepositoryMixin {
  const WeatherAppRepository({
    required WeatherRemoteDataSource weatherRemoteDataSource,
  }) : _weatherRemoteDataSource = weatherRemoteDataSource;

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  @override
  Future<WeatherModel?> getWeatherForCoordinatesAndDate({
    required double? longitude,
    required double? latitude,
    required DateTime? date,
  }) async {
    final bool canGetWeather =
        longitude != null && latitude != null && date != null;
    if (!canGetWeather) return null;

    final bool isDateInPast = date.isBefore(DateTime.now());
    if (isDateInPast) return null;

    final WeatherForecastRemoteDTO remoteDTO =
        await _weatherRemoteDataSource.getWeatherForCoordinatesAndTime(
      longitude: longitude,
      latitude: latitude,
      date: date,
    );

    final WeatherModel model = remoteDtoToModel(remoteDTO);
    return model;
  }
}
