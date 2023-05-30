import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';
import 'package:rxdart/rxdart.dart';

class PlayerPreferencesAppRepository implements PlayerPreferencesRepository {
  PlayerPreferencesAppRepository() {
    // here we can initially retreive player location
  }

  @override
  Stream<String?> get avatarUrlStream => _avatarUrlSubject.distinct();
  @override
  Stream<LocationValue?> get playerCurrentLocationStream =>
      _playerCurrentLocationSubject.distinct();
  @override
  Stream<int?> get playerRegionSizeStream =>
      _playerRegionSizeSubject.distinct();
  @override
  Stream<TeamModel?> get playerTeamStream => _playerTeamSubject.distinct();

  @override
  void setAvatarUrl(String avatarUrl) {
    _avatarUrlSink.add(avatarUrl);
  }

  @override
  void setPlayerCurrentLocation(LocationValue location) {
    _playerCurrentLocationSink.add(location);
  }

  @override
  void setPlayerRegionSize(int regionSize) {
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

  Future<void> _handleInitialPlayerLocation() async {
    // all is hardcoded for now
    // TODO should we have a data source for this, or there might be a package for this?

    // TODO get coordinates

    // get location name from coordinates

    // set location name and coordinates in the subject
  }

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
