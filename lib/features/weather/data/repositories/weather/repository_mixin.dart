import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/models/weather/model.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';

mixin WeatherRepositoryMixin on WeatherRepository {
  // transformers
  WeatherModel remoteDtoToModel(
    WeatherForecastRemoteDTO dto,
  ) {
    final WeatherModel model = WeatherModel.fromWeathaerForecastRemoteDTO(dto);

    return model;
  }
}
