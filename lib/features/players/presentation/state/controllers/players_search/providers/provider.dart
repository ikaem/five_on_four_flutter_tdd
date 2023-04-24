import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/data/data_sources/players_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

// TODO lets not do it, so that first event is not triggered with empty fields
final PlayersSearchFilters _initialFilters = PlayersSearchFilters(
  searchTerm: "",
);

@riverpod
class PlayersSearchAppController extends _$PlayersSearchAppController
    implements PlayersSearchController {
// TODO tis needs service
  late final PlayersGetService playersGetService =
      ref.read(playersGetAppServiceProvider);

  final BehaviorSubject<PlayersSearchFilters> _filtersSubject =
      // BehaviorSubject.seeded(_initialFilters);
      BehaviorSubject();
  late StreamSubscription<PlayersSearchFilters> _filtersSubscription;
  StreamSink<PlayersSearchFilters> get _filtersSink => _filtersSubject.sink;

  @override
  AsyncValue<List<PlayerModel>> build() {
    // ref.onDispose(() {});
    // TOOO maybe because of tghis, this is better to be async notifier
    _initializeController();
    return AsyncValue.data([]);
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    // TODO DOES THIS HAVE dispose anyhow built in
    throw UnimplementedError();
  }

// TODO this will probably be called on each type
// TODO we need to add debounce here
// TODO this can actually be  called in a subscription on the stream here
// TODO so this would be easiy ow to apply debounce on streams
  Future<void> _onSearchPlayers(PlayersSearchFilters filters) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final results = await playersGetService.handleSearchPlayers(filters);

      return results;
    });
  }

  // ok, a function to change fileters
  @override
  void onChangeSearchTerm(String searchTerm) {
    PlayersSearchFilters latestFilters;
    final bool isFilterWithValue = _filtersSubject.hasValue;
    if (!isFilterWithValue) {
      latestFilters = _initialFilters;
    } else {
      latestFilters = _filtersSubject.value;
    }

    final PlayersSearchFilters updatedFilter =
        latestFilters.copyWith(searchTerm: searchTerm);

    _filtersSink.add(updatedFilter);
  }

  // TODO this might be needed to set up on dispose, to clean up some stuff
  // TODO if this turns up to be async, do convert this to async notifier
  void _initializeController() {
    // TODO disposeal

    _filtersSubscription = _filtersSubject.stream.listen((event) {
      _onSearchPlayers(event);
    });

    ref.onDispose(() async {
      // TODO when is this called
      await _filtersSubscription.cancel();
      await _filtersSubject.close();
    });
  }

  @override
  void close() {}
}
