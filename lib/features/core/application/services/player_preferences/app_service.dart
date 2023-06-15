import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_repository.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/repository_interfaces/auth_status_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/value_from_env.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/repositories_interfaces/matches_repository.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/repository_interfaces/players_repository.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/geolocator_wrapper.dart';

// TODO this could potentually be initialized in bootstrap to make sure we get location
class PlayerPreferencesAppService extends PlayerPreferencesService {
  PlayerPreferencesAppService({
    required GeocodingWrapper geocodingWrapper,
    required GeolocatorWrapper geolocatorWrapper,
    required PlayerPreferencesRepository playerPreferencesRepository,
    required AuthStatusRepository authStatusRepository,
    required PlayersRepository playersRepository,
    required MatchesRepository matchesRepository,
    required AuthRepository authRepository,
  })  : _geocodingWrapper = geocodingWrapper,
        _geolocatorWrapper = geolocatorWrapper,
        _authStatusRepository = authStatusRepository,
        _playersRepository = playersRepository,
        _matchesRepository = matchesRepository,
        _authRepository = authRepository,
        _playerPreferencesRepository = playerPreferencesRepository;

  final GeocodingWrapper _geocodingWrapper;
  final GeolocatorWrapper _geolocatorWrapper;
  final PlayerPreferencesRepository _playerPreferencesRepository;
  final AuthStatusRepository _authStatusRepository;
  final PlayersRepository _playersRepository;
  final MatchesRepository _matchesRepository;
  final AuthRepository _authRepository;

// TODO not sure i will need this as a stream
  // @override
  // Stream<LocationValue?> get currentLocationStream =>
  //     _playerPreferencesRepository.playerCurrentLocationStream;

  @override
  int? get regionSize => _playerPreferencesRepository.playerRegionSize;
  @override
  LocationValue? get currentLocation =>
      _playerPreferencesRepository.playerCurrentLocation;

  @override
  // TODO: implement currentPlayerNickname
  // String? get currentPlayerNickname =>
  //     _playerPreferencesRepository.playerNickname;

  String? get currentPlayerNickname =>
      _playerPreferencesRepository.currentPlayer?.nickname;

  // @override
  // Stream<int?> get regionSizeStream =>
  //     _playerPreferencesRepository.playerRegionSizeStream;

  @override
  Future<void> initialize() async {
// TODO here we want to know if we are in dev mode
// TODO test

    final bool isProductionMode = ValueFromEnv.isProduction;
    if (!isProductionMode) {
      // TODO abstract this
      final LocationValue devLocation = LocationValue(
        name: "Pula",
        coordinates: CoordinatesModel(
          latitude: 44.8666,
          longitude: 13.8499,
        ),
      );

      _playerPreferencesRepository.setPlayerCurrentLocation(devLocation);
      return;
    }

    try {
      final CoordinatesModel coordinates =
          await _geolocatorWrapper.getCurrentPosition();
      final LocationValue currentLocation =
          await _geocodingWrapper.getPlaceForCoordinates(
        longitude: coordinates.longitude,
        latitude: coordinates.latitude,
      );

      _playerPreferencesRepository.setPlayerCurrentLocation(currentLocation);
      // TOOD this should also set the current region, retreived i guess from shared preferences
    } catch (e) {
      _playerPreferencesRepository.setPlayerCurrentLocation(null);
    }
  }

  @override
  Future<void> handleDeleteAccount() async {
    // TODO this should probably use some kind of transaction - maybe via functions on firebase for now
// TODO test
    // await Future.delayed(Duration(seconds: 2));

    final AuthModel? auth = _authStatusRepository.getAuthStatus();
    if (auth == null) {
      // FUTURE: throw proper exception
      // FUTURE: maybe logout, but maybe is not needed
      throw "Something";
    }

    // remove all match participations
    await _matchesRepository.deletePlayerMatchParticipations(auth.id);

    // remove user from all matches that they organized - make it null
    await _matchesRepository.removePlayerAsMatchesOrganizer(auth.id);

    // remove player entry
    await _playersRepository.deletePlayer(auth.id);

    // remote auth entry - the account
    await _authRepository.deleteCurrentUser();

    // TODO logout

    await _authRepository.logout();
    _authStatusRepository.setAuth(null);
  }

  @override
  Future<void> handleChangedRegionSize(
    int regionSize,
  ) async {
    // TODO this is issue - first request is treiggered because the controller initially sets value of its own subject, and then seets up listener on it to update
    // TODO need to prevent this
    final AuthModel? auth = _authStatusRepository.getAuthStatus();
    if (auth == null) {
      // FUTURE: throw proper exception
      // FUTURE: maybe logout, but maybe is not needed
      throw "Something";
    }

// 1. set region size remotely - so it needs to ping player repository to update player region size in firebase
    await _playersRepository.updatePlayerPreferencesRegionSize(
      playerId: auth.id,
      regionSize: regionSize,
    );

// 2. set region size locally - it will update this players preferences in isar eventually

// 3. set region size in player preferences repository - so it needs to update player preferences repository - this will be set here

    _playerPreferencesRepository.setPlayerRegionSize(regionSize);
  }
}
