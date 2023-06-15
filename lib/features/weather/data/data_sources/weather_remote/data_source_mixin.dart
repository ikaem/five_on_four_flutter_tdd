import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';
import 'package:intl/intl.dart';

mixin WeatherRemoteDataSourceMixin on WeatherRemoteDataSource {
  // transformers
  WeatherForecastRemoteDTO responseToDto(
    Map<String, dynamic> data,
  ) {
    final WeatherForecastRemoteDTO dto =
        WeatherForecastRemoteDTO.fromJson(data);

    return dto;
  }

  // helpers
  Map<String, String> generateGetWeatherForCoordinatesQueryParams({
    required double longitude,
    required double latitude,
    required DateTime date,
  }) {
    final String formattedDate =
        DateFormat(AppConstants.dateFormatFormal).format(date);
    final int hour = date.hour;

    final Map<String, String> params = {
      'q': '$latitude,$longitude',
      "days": "1",
      "dt": formattedDate,
      "hour": hour.toString(),
    };

    return params;
  }
}
