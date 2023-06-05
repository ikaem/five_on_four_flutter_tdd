import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';
import 'package:rxdart/rxdart.dart';

class PlayerPreferencesAppRepository implements PlayerPreferencesRepository {
  // TODO do we need preferences to be behavior subjects if we dont expose streams? we probably do, to make sure update info can get retreived, and set? or is it? wait and see
  PlayerPreferencesAppRepository() {
    // here we can initially retreive player location
    // NO, we will retreive initial player location in the service
    // and then service can set the repository
    // because the repository same instance can be used in multiple services
    // and the service will expose these values to profile page
  }

  @override
  Stream<String?> get avatarUrlStream => _avatarUrlSubject.distinct();

  // TODO not needed
  // @override
  // Stream<LocationValue?> get playerCurrentLocationStream =>
  //     _playerCurrentLocationSubject.distinct();
  @override
  // Stream<int?> get playerRegionSizeStream =>
  //     _playerRegionSizeSubject.distinct();
  @override
  Stream<TeamModel?> get playerTeamStream => _playerTeamSubject.distinct();

  @override
  // TODO: implement playerRegionSize
  int? get playerRegionSize => _playerRegionSizeSubject.valueOrNull;

  @override
  // TODO: implement playerCurrentLocation
  LocationValue? get playerCurrentLocation =>
      _playerCurrentLocationSubject.valueOrNull;

  @override
  void setAvatarUrl(String avatarUrl) {
    _avatarUrlSink.add(avatarUrl);
  }

  @override
  void setPlayerCurrentLocation(LocationValue? location) {
    _playerCurrentLocationSink.add(location);
  }

  @override
  void setPlayerRegionSize(int? regionSize) {
    _playerRegionSizeSink.add(regionSize);
  }

  @override
  void setPlayerTeam(TeamModel team) {
    _playerTeamSink.add(team);
  }

  @override
  Future<void> dispose() async {
    await _avatarUrlSubject.close();
    await _playerCurrentLocationSubject.close();
    await _playerRegionSizeSubject.close();
    await _playerTeamSubject.close();
  }

  // Future<void> _handleInitialPlayerLocation() async {
  //   // all is hardcoded for now
  //   // TODO should we have a data source for this, or there might be a package for this?

  //   // TODO get coordinates

  //   // get location name from coordinates

  //   // set location name and coordinates in the subject
  // }

  final BehaviorSubject<String?> _avatarUrlSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<LocationValue?> _playerCurrentLocationSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<int?> _playerRegionSizeSubject =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<TeamModel?> _playerTeamSubject =
      BehaviorSubject.seeded(null);

  StreamSink<String?> get _avatarUrlSink => _avatarUrlSubject.sink;
  StreamSink<LocationValue?> get _playerCurrentLocationSink =>
      _playerCurrentLocationSubject.sink;
  StreamSink<int?> get _playerRegionSizeSink => _playerRegionSizeSubject.sink;
  StreamSink<TeamModel?> get _playerTeamSink => _playerTeamSubject.sink;
}
