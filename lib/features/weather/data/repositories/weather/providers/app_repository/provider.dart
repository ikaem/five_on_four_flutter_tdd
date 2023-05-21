import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/data_sources/weather_remote/providers/app_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/repositories/weather/app_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
WeatherRepository weatherRepository(
  WeatherRepositoryRef ref,
) {
  final WeatherRemoteDataSource weatherRemoteDataSource =
      ref.read(weatherRemoteDataSourceProvider);

  final WeatherRepository weatherRepository =
      WeatherAppRepository(weatherRemoteDataSource: weatherRemoteDataSource);

  return weatherRepository;
}
