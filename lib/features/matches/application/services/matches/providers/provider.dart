import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/repositories/matches/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/weather/data/repositories/weather/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/weather/domain/repositories_interfaces/weather_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/cloud_functions_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/firebase/cloud_functions/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
MatchesService matchesService(MatchesServiceRef ref) {
  final GeocodingWrapper locationWrapper = ref.read(geocodingWrapperProvider);
  final MatchesRepository matchesRepository =
      ref.read(matchesRepositoryProvider);
  final AuthStatusRepository authStatusRepository =
      ref.read(authStatusRepositoryProvider);
  final WeatherRepository weatherRepository =
      ref.read(weatherRepositoryProvider);
  final FirebaseFunctionsWrapper firebaseFunctionsWrapper =
      ref.read(firebaseFunctionsWrapperProvider);

  final MatchesService matchesService = MatchesAppService(
    matchesRepository: matchesRepository,
    authStatusRepository: authStatusRepository,
    locationWrapper: locationWrapper,
    weatherRepository: weatherRepository,
    firebaseFunctionsWrapper: firebaseFunctionsWrapper,
  );

  return matchesService;
}
