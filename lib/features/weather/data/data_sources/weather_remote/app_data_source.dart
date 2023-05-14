import 'package:five_on_four_flutter_tdd/features/core/domain/values/http_request/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/http_constants.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/constants/weather_constants.dart';
import 'package:five_on_four_flutter_tdd/libraries/dio/http_client_wrapper.dart';
import 'package:intl/intl.dart';

/* TODO we could extend the interface, and then would be able to mixin stuff */
// TODO tesing extending
class WeatherRemoteAppDataSource extends WeatherRemoteDataSource
    with WeatherRemoteDataSourceMixin {
  const WeatherRemoteAppDataSource({
    required HttpClientWrapper httpClientWrapper,
  }) : _httpClientWrapper = httpClientWrapper;

  final HttpClientWrapper _httpClientWrapper;

  @override
  Future<WeatherForecastRemoteDTO> getWeatherForCoordinatesAndTime({
    required double longitude,
    required double latitude,
    // required
    // required DateTime date,
  }) async {
    final HttpRequestUriPartsValue uriParts = HttpRequestUriPartsValue(
      apiUrlScheme: HttpConstants.httpsProtocol,
      apiBaseUrl: WeatherConstants.baseUrl,
      apiContextPath: WeatherConstants.contextPath,
      // TODO old
      // apiEndpointPath: WeatherConstants.currentWeatherPath,
      apiEndpointPath: WeatherConstants.forecastWeatherPath,
      queryParameters: generateGetWeatherForCoordinatesQueryParams(
        longitude: longitude,
        latitude: latitude,
      ),
    );

    final Map<String, dynamic> data =
        await _httpClientWrapper.get<Map<String, dynamic>>(uriParts: uriParts);

    final WeatherForecastRemoteDTO dto = responseToDto(data);

    return dto;
  }
}

// TODO mixin to help with additional stuff
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
  }) {
    final DateTime tempMatchDate = DateTime.now().add(Duration(days: 2));
    // TODO make this a constants in weahter constants
    final String formattedDate = DateFormat("yyyy-MM-dd").format(tempMatchDate);
    final int hour = tempMatchDate.hour;

// TODO make these constants in weather constants
    final Map<String, String> params = {
      'q': '$latitude,$longitude',
      // TODO TEST
      "days": 1.toString(),
      "dt": formattedDate,
      "hour": hour.toString(),
      // TODO interceptor should add api key
    };

    return params;
  }
}
