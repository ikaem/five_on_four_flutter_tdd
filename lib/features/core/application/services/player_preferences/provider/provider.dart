import 'package:five_on_four_flutter_tdd/features/auth/data/repositories/auth_status/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/app_service.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/data/repositories/player_preferences/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/repositories/players/providers/app_repository/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
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
  final AuthStatusRepository authStatusRepository =
      ref.read(authStatusRepositoryProvider);
  final PlayersRepository playersRepository =
      ref.read(playersAppRepositoryProvider);

  final PlayerPreferencesService playerPreferencesService =
      PlayerPreferencesAppService(
    geocodingWrapper: geocodingWrapper,
    geolocatorWrapper: geolocatorWrapper,
    playerPreferencesRepository: playerPreferencesRepository,
    authStatusRepository: authStatusRepository,
    playersRepository: playersRepository,
  );

  return playerPreferencesService;
}
