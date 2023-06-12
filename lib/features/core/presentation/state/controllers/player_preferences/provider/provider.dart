import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/repository_interfaces/player_preferences_repository.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/location/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

// SETTING OF PREFERENCES BY user can only be done via this controller
// FUTURE possibly move delete functionality to separate controller for better feedback to user
@riverpod
class PlayerPreferencesAppController extends _$PlayerPreferencesAppController
    implements PlayerPreferencesController {
  late final PlayerPreferencesService _playerPreferencesService =
      ref.read(playerPreferencesServiceProvider);

  @override
  Stream<int> get regionSizeStream => _regionSizeSubject.distinct();
  @override
  Stream<LocationValue?> get currentLocationStream =>
      throw UnimplementedError();

  @override
  // TODO: implement currentPlayerNickname
  String get currentPlayerNickname =>
      _playerPreferencesService.currentPlayerNickname ?? "Superstar";

// TODO this is direct stream from the service, but we might want to do some debouncing, so will implement buffered one here
  // @override
  // // TODO: implement regionSizeStream
  // Stream<int?> get regionSizeStream =>
  //     _playerPreferencesService.regionSizeStream;

  // @override
  // Stream<LocationValue?> get currentLocationStream =>
  //     _playerPreferencesService.currentLocationStream;

  @override
  AsyncValue<void> build() {
    _initializeController();

    return const AsyncValue.data(null);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // TODO not sure if anyhting needsto be disposed of - we will see

    ref.onDispose(() async {
      await _regionSizeSubscription.cancel();
      await _regionSizeSubject.close();
    });
  }

  @override
  Future<void> onDeleteAccount() async {
    state = AsyncValue.loading();

    try {
      await _playerPreferencesService.handleDeleteAccount();
      state = AsyncValue.data(null);
    } catch (e) {
// TODO we can specify which error happened maybe?
      state = AsyncValue.error("deleteAccount", StackTrace.current);
    }
  }

  @override
  onChangeRegionSize(int regionSize) {
    _regionSizeSink.add(regionSize);
  }

  @override
  Future<void> onChangeTeam(TeamModel team) {
    // TODO: implement onChangeTeam
    throw UnimplementedError();
  }

  void _initializeController() {
    // get initial value from repository and set it as initial value of the behavior subject - do not subscribe and set because it will lead to infinite loop
    final int? initialRegionSize = _playerPreferencesService.regionSize;
    _regionSizeSink.add(initialRegionSize ?? 0);

    // subscribe to local region size stream controller - add debouncing to it and call on change region size
    // TODO make sure that it does not react to initial set here
    _regionSizeSubscription = regionSizeStream
        .debounceTime(const Duration(milliseconds: 500))
        // TOOD should probably handle on error to
        .listen(_onSubmitChangedRegionSize);

    // call dispose
    dispose();
  }

  Future<void> _onSubmitChangedRegionSize(int regionSize) async {
    // TODO create ticket for handle change region size, and put all these comments there  when finished here
    // TODO this should also, probably be foing some debouncing
    // TODO debouncing might be doen by having another subject here, as a buffer for the values
    // and then, we can set up listener for that subject, and then, we can do the debouncing
    // and that listener would call this particular method
    // TODO this will actually be calling esrvices some remote stuff

    // TODO ideally, i would like to have a way to cancel the previous request
    // TODO ideally, i would like to have loading only for this piece of preferences

// TODO we could emit actual data state, but specify if it is loading, or such
    state = AsyncValue.loading();

    try {
      await _playerPreferencesService.handleChangedRegionSize(regionSize);
      state = AsyncValue.data(null);
    } catch (e) {
// TODO we can specify which error happened maybe?
      state = AsyncValue.error("regionSize", StackTrace.current);
    }
  }

  // buffer and debouncing stream controllers
  // TOOD we now might want to initialize the controller here, to set this first value of the behavior subject based on repository value

  final BehaviorSubject<int> _regionSizeSubject = BehaviorSubject();
  StreamSink<int> get _regionSizeSink => _regionSizeSubject.sink;
  late final StreamSubscription<int> _regionSizeSubscription;
}
