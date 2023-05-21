import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';

class WeatherAppRepository extends WeatherRepository
    with WeatherRepositoryMixin {
  const WeatherAppRepository({
    required WeatherRemoteDataSource weatherRemoteDataSource,
  }) : _weatherRemoteDataSource = weatherRemoteDataSource;

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  @override
  Future<WeatherModel?> getWeatherForCoordinates({
    required double? longitude,
    required double? latitude,
  }) async {
    final bool canGetWeather = longitude != null && latitude != null;
    if (!canGetWeather) return null;

// TODO potentially we can wrap this in try catch and return null
// if there is an error, just log it for now
    final WeatherForecastRemoteDTO remoteDTO =
        await _weatherRemoteDataSource.getWeatherForCoordinatesAndTime(
      longitude: longitude,
      latitude: latitude,
    );

    final WeatherModel model = remoteDtoToModel(remoteDTO);
    return model;
  }
}

// TODO mixin to help with additional stuff
// TODO move to mixins or leave here
mixin WeatherRepositoryMixin on WeatherRepository {
  // transformers
  WeatherModel remoteDtoToModel(
    WeatherForecastRemoteDTO dto,
  ) {
    final WeatherModel model = WeatherModel.fromWeathaerForecastRemoteDTO(dto);

    return model;
  }
}
