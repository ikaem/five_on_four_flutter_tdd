import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/data_source.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

final MatchesSearchFilters _initialFilters = MatchesSearchFilters(
  searchTerm: "",
);

@riverpod
class MatchesSearchController extends _$MatchesSearchController {
  late final MatchesService matchesService = ref.read(matchesServiceProvider);

  final BehaviorSubject<MatchesSearchFilters> _filtersSubject =
      // BehaviorSubject.seeded(_initialFilters);
      BehaviorSubject();

  late StreamSubscription<MatchesSearchFilters> _filtersSubscription;
  StreamSink<MatchesSearchFilters> get _filtersSink => _filtersSubject.sink;

  @override
  AsyncValue<List<MatchModel>> build() {
    // ref.onDispose(() {});
    // TOOO maybe because of tghis, this is better to be async notifier
    _initializeController();
    // TODO we could have returned loading as well - but lets return empty data initially
    return AsyncValue.data([]);
  }

  @override
  void onChangeSearchTerm(String searchTerm) {
    MatchesSearchFilters latestFilters;
    final bool isFilterWithValue = _filtersSubject.hasValue;
    if (!isFilterWithValue) {
      latestFilters = _initialFilters;
    } else {
      latestFilters = _filtersSubject.value;
    }

    final MatchesSearchFilters updatedFilter =
        latestFilters.copyWith(searchTerm: searchTerm);

    _filtersSink.add(updatedFilter);
  }

  Future<void> _onSearchMatches(MatchesSearchFilters filters) async {
    state = AsyncValue.loading();

    try {
      final List<MatchModel> results =
          await matchesService.handleSearchMatches(filters);
      state = AsyncValue.data(results);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // TODO this might be needed to set up on dispose, to clean up some stuff
  // TODO if this turns up to be async, do convert this to async notifier
  void _initializeController() {
    // TODO disposeal

// TODO this should ebnounce
    _filtersSubscription = _filtersSubject.stream
        .debounceTime(Duration(milliseconds: 500))
        .listen((event) {
      // TODO test
      _onSearchMatches(event);
    });

    ref.onDispose(() async {
      // TODO when is this called
      await _filtersSubscription.cancel();
      await _filtersSubject.close();
    });
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    // TODO DOES THIS HAVE dispose anyhow built in
    throw UnimplementedError();
  }
}
