import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/app_data_source.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/libraries/dio/http_client_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/dio/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
WeatherRemoteDataSource weatherRemoteDataSource(
  WeatherRemoteDataSourceRef ref,
) {
  final HttpClientWrapper httpClientWrapper =
      ref.read(httpClientWrapperProvider);

  final WeatherRemoteDataSource weatherRemoteDataSource =
      WeatherRemoteAppDataSource(httpClientWrapper: httpClientWrapper);

  return weatherRemoteDataSource;
}
