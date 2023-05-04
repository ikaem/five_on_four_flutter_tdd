import 'dart:developer';

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

// TODO might want to have this, but not sure yet
  // AsyncValue<void> get stateValue => state;

  @override
  AsyncValue<void> build({
    required MatchModel match,
    required VoidCallback onMatchJoinAction,
  }) {
    ref.onDispose(() async {
      await dispose();
    });
    return AsyncLoading();

    // TODO we possibly can call dipose in here
  }

  // @override
  Future<void> dispose() async {
    log("disposing where and when?");
  }

  @override
  Future<void> onToggleMatchParticipation(
      // String matchId,
      ) async {
    state = AsyncValue.loading();

    try {
      // TODO this manually has match
      await _matchesService.handleJoinMatch(match);

      // state = AsyncValue.data(null);

      final me = "3";

      // TODO test
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    } finally {
      onMatchJoinAction();
    }
    // TODO test
  }
}
