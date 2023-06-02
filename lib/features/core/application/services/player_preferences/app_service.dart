import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/models/coordinates/model.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';
import 'package:five_on_four_flutter_tdd/libraries/geocoding/geocoding_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/geolocator/geolocator_wrapper.dart';

// TODO this could potentually be initialized in bootstrap to make sure we get location
class PlayerPreferencesAppService extends PlayerPreferencesService {
  PlayerPreferencesAppService({
    required GeocodingWrapper geocodingWrapper,
    required GeolocatorWrapper geolocatorWrapper,
    required PlayerPreferencesRepository playerPreferencesRepository,
  })  : _geocodingWrapper = geocodingWrapper,
        _geolocatorWrapper = geolocatorWrapper,
        _playerPreferencesRepository = playerPreferencesRepository;

  final GeocodingWrapper _geocodingWrapper;
  final GeolocatorWrapper _geolocatorWrapper;
  final PlayerPreferencesRepository _playerPreferencesRepository;

  @override
  Future<void> initialize() async {
    try {
      final CoordinatesModel coordinates =
          await _geolocatorWrapper.getCurrentPosition();
      final LocationValue currentLocation =
          await _geocodingWrapper.getPlaceForCoordinates(
        longitude: coordinates.longitude,
        latitude: coordinates.latitude,
      );

      _playerPreferencesRepository.setPlayerCurrentLocation(currentLocation);
    } catch (e) {
      _playerPreferencesRepository.setPlayerCurrentLocation(null);
    }
  }
}
