import 'package:five_on_four_flutter_tdd/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialDataController
    extends StateNotifier<AsyncValue<InitialDataValue>> {
  InitialDataController({
    required this.initialDataService,
    // }) : super(AsyncValue.data(InitialDataValue.empty()));
  }) : super(AsyncValue.loading());

  final InitialDataService initialDataService;

  Future<void> onLoadInitialData() async {
    // state = const AsyncValue.loading(); // -> this fails because

    // final Future<List<MatchModel>> invitedMatchesFuture =
    //     initialDataService.getCurrentPlayerInvitedMatches();
    // final Future<List<MatchModel>> joinedMatchesFuture =
    //     initialDataService.getCurrentPlayerJoinedMatches();
    // final Future<MatchInfoModel> nextMatchFuture =
    //     initialDataService.getCurrentPlayerNextMatch();

    // final List<Object> responses = await Future.wait([
    //   invitedMatchesFuture,
    //   joinedMatchesFuture,
    //   nextMatchFuture,
    // ]);

    // final List<MatchModel> invitedMatches = responses[0] as List<MatchModel>;
    // final List<MatchModel> joinedMatches = responses[1] as List<MatchModel>;
    // final MatchInfoModel nextMatch = responses[2] as MatchInfoModel;

    // final InitialDataValue initialDataValue = InitialDataValue(
    //   invitedMatches: invitedMatches,
    //   joinedMatches: joinedMatches,
    //   nextMatch: nextMatch,
    // );

    // state = AsyncValue.data(initialDataValue);

    // final date = DateTime.now(); // -> this passes bc not async

    // final List<MatchModel> invitedMatchesFuture =
    //     await initialDataService.getCurrentPlayerInvitedMatches();

    // log("here we are!!!!!!!!!!!!!!!");

    state = await AsyncValue.guard(() async {
      final Future<List<MatchModel>> invitedMatchesFuture =
          initialDataService.getCurrentPlayerInvitedMatches();
      final Future<List<MatchModel>> joinedMatchesFuture =
          initialDataService.getCurrentPlayerJoinedMatches();
      final Future<MatchInfoModel> nextMatchFuture =
          initialDataService.getCurrentPlayerNextMatch();

      final List<Object> responses = await Future.wait([
        invitedMatchesFuture,
        joinedMatchesFuture,
        nextMatchFuture,
      ]);

      final List<MatchModel> invitedMatches = responses[0] as List<MatchModel>;
      final List<MatchModel> joinedMatches = responses[1] as List<MatchModel>;
      final MatchInfoModel nextMatch = responses[2] as MatchInfoModel;

      final InitialDataValue initialDataValue = InitialDataValue(
        invitedMatches: invitedMatches,
        joinedMatches: joinedMatches,
        nextMatch: nextMatch,
      );

      return initialDataValue;
    });
  }
}
