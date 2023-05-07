import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_join/controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class MatchJoinAppController extends _$MatchJoinAppController
    implements MatchJoinController {
  late final MatchesService _matchesService = ref.read(matchesServiceProvider);

  bool get hasCurrentPlayerJoinedMatch =>
      _matchesService.checkHasPlayerJoinedMatch(match);

  @override
  AsyncValue<void> build({
    required MatchModel match,
    required VoidCallback onMatchJoinAction,
  }) {
    return AsyncLoading();
  }

  @override
  Future<void> onToggleMatchParticipation() async {
    state = AsyncValue.loading();

    try {
      await _matchesService.handleJoinMatch(match);
      state = AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      onMatchJoinAction();
    }
  }
}
