import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/data/repositories/player_preferences/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/geolocator_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/provider/provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@Riverpod(keepAlive: true)
PlayerPreferencesService playerPreferencesService(
  PlayerPreferencesServiceRef ref,
) {
  final GeocodingWrapper geocodingWrapper = ref.read(geocodingWrapperProvider);
  final GeolocatorWrapper geolocatorWrapper =
      ref.read(geolocatorWrapperProvider);
  final PlayerPreferencesRepository playerPreferencesRepository =
      ref.read(playerPreferencesRepositoryProvider);

  final PlayerPreferencesService playerPreferencesService =
      PlayerPreferencesAppService(
    geocodingWrapper: geocodingWrapper,
    geolocatorWrapper: geolocatorWrapper,
    playerPreferencesRepository: playerPreferencesRepository,
  );

  return playerPreferencesService;
}
