import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/values/players_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/controller.dart';
import 'package:five_on_four_flutter_tdd/libraries/libraries.dart';
import 'package:five_on_four_flutter_tdd/libraries/logger/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

// TODO move to values
@immutable
class PlayersSearchOptions {
  const PlayersSearchOptions({
    required this.shouldSearchCurrentUser,
  });

  final bool shouldSearchCurrentUser;
}

final PlayersSearchFiltersValue _initialFilters = PlayersSearchFiltersValue(
  searchTerm: "",
);

@riverpod
class PlayersSearchAppController extends _$PlayersSearchAppController
    implements PlayersSearchController {
  late final PlayersService playersService =
      ref.read(playersAppServiceProvider);

  late final LoggerWrapper logger = ref.read(loggerWrapperProvider);

  final BehaviorSubject<PlayersSearchFiltersValue> _filtersSubject =
      BehaviorSubject();
  late StreamSubscription<PlayersSearchFiltersValue> _filtersSubscription;
  StreamSink<PlayersSearchFiltersValue> get _filtersSink =>
      _filtersSubject.sink;

  @override
  AsyncValue<List<PlayerModel>> build(
    // TODO testing only
    PlayersSearchOptions options,
  ) {
    _initializeController();
    return AsyncValue.data([]);
  }

  Future<void> _onSearchPlayers(PlayersSearchFiltersValue filters) async {
    state = AsyncValue.loading();

    try {
      final List<PlayerModel> results =
          await playersService.handleSearchPlayers(
        filters: filters,
        options: options,
      );

      state = AsyncValue.data(results);
    } catch (e) {
      logger.log(
        logLevel: Level.error,
        message: "There was an error searching players",
        stackTrace: StackTrace.current,
        error: e,
      );
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  @override
  void onChangeSearchTerm(String searchTerm) {
    PlayersSearchFiltersValue latestFilters;
    final bool isFilterWithValue = _filtersSubject.hasValue;
    if (!isFilterWithValue) {
      latestFilters = _initialFilters;
    } else {
      latestFilters = _filtersSubject.value;
    }

    final PlayersSearchFiltersValue updatedFilter =
        latestFilters.copyWith(searchTerm: searchTerm);

    _filtersSink.add(updatedFilter);
  }

  void _initializeController() {
    _filtersSubscription = _filtersSubject.stream
        .debounceTime(Duration(milliseconds: 500))
        .listen((event) {
      _onSearchPlayers(event);
    });

    ref.onDispose(() async {
      await _filtersSubscription.cancel();
      await _filtersSubject.close();
    });
  }
}
