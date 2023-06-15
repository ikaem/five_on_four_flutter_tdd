import 'package:five_on_four_flutter_tdd/features/core/domain/values/http_request/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/http_constants.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source_mixin.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/dtos/weather_forecast_remote/dto.dart';
import 'package:five_on_four_flutter_tdd/features/weather/utils/constants/weather_constants.dart';
import 'package:five_on_four_flutter_tdd/libraries/dio/http_client_wrapper.dart';

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
    required DateTime date,
  }) async {
    final HttpRequestUriPartsValue uriParts = HttpRequestUriPartsValue(
      apiUrlScheme: HttpConstants.httpsProtocol,
      apiBaseUrl: WeatherConstants.baseUrl,
      apiContextPath: WeatherConstants.contextPath,
      apiEndpointPath: WeatherConstants.forecastWeatherPath,
      queryParameters: generateGetWeatherForCoordinatesQueryParams(
        longitude: longitude,
        latitude: latitude,
        date: date,
      ),
    );

    final Map<String, dynamic> data =
        await _httpClientWrapper.get<Map<String, dynamic>>(uriParts: uriParts);

    final WeatherForecastRemoteDTO dto = responseToDto(data);

    return dto;
  }
}

// TODO mixin to help with additional stuff
