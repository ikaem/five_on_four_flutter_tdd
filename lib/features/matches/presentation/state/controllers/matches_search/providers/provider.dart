import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/matches_search_filters/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/matches_search/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

final MatchesSearchFiltersValue _initialFilters = MatchesSearchFiltersValue(
  searchTerm: "",
);

@riverpod
class MatchesSearchAppController extends _$MatchesSearchAppController
    implements MatchesSearchController {
  late final MatchesService matchesService = ref.read(matchesServiceProvider);

  final BehaviorSubject<MatchesSearchFiltersValue> _filtersSubject =
      BehaviorSubject();

  late StreamSubscription<MatchesSearchFiltersValue> _filtersSubscription;
  StreamSink<MatchesSearchFiltersValue> get _filtersSink =>
      _filtersSubject.sink;

  @override
  AsyncValue<List<MatchModel>> build() {
    _initializeController();
    return AsyncValue.data([]);
  }

  @override
  void onChangeSearchTerm(String searchTerm) {
    MatchesSearchFiltersValue latestFilters;
    final bool isFilterWithValue = _filtersSubject.hasValue;
    if (!isFilterWithValue) {
      latestFilters = _initialFilters;
    } else {
      latestFilters = _filtersSubject.value;
    }

    final MatchesSearchFiltersValue updatedFilter =
        latestFilters.copyWith(searchTerm: searchTerm);

    _filtersSink.add(updatedFilter);
  }

  Future<void> _onSearchMatches(MatchesSearchFiltersValue filters) async {
    state = AsyncValue.loading();

    try {
      final List<MatchModel> results =
          await matchesService.handleSearchMatches(filters);
      state = AsyncValue.data(results);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void _initializeController() {
    _filtersSubscription = _filtersSubject.stream
        .debounceTime(Duration(milliseconds: 500))
        .listen((event) {
      _onSearchMatches(event);
    });

    dispose();
  }

  @override
  void dispose() {
    ref.onDispose(() async {
      await _filtersSubscription.cancel();
      await _filtersSubject.close();
    });
  }
}
