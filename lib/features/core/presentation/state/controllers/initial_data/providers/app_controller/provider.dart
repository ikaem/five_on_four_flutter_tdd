import 'package:five_on_four_flutter_tdd/features/core/application/services/initial_data/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/initial_data/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/controller.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@Riverpod(keepAlive: true)
class InitialDataAppController extends _$InitialDataAppController
    implements InitialDataController {
  late final InitialDataService initialDataService =
      ref.read(initialDataServiceProvider);

  @override
  AsyncValue<InitialDataValue?> build() {
    // Future<InitialDataValue?> build() async {
    // return null;

    // return AsyncValue.data(null);
    return AsyncValue.loading();
  }

  Future<void> onLoadInitialData() async {
    // state = const AsyncValue.loading();

    print("IS THIS PRINTED!!!!!!!!");

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