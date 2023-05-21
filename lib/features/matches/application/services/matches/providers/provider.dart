import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/repositories/weather/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/location_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
MatchesService matchesService(MatchesServiceRef ref) {
  final LocationWrapper locationWrapper = ref.read(locationWrapperProvider);
  final MatchesRepository matchesRepository =
      ref.read(matchesRepositoryProvider);
  // TODO not sure if this should be watch or read - read is probably fine, but test
  final AuthStatusRepository authStatusRepository =
      ref.watch(authStatusRepositoryProvider);

  final WeatherRepository weatherRepository =
      ref.read(weatherRepositoryProvider);

  final MatchesService matchesService = MatchesAppService(
    matchesRepository: matchesRepository,
    authStatusRepository: authStatusRepository,
    locationWrapper: locationWrapper,
    weatherRepository: weatherRepository,
  );

  return matchesService;
}
