import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_info_get/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class MatchInfoGetAppController extends _$MatchInfoGetAppController
    implements MatchInfoGetController {
  late final MatchesService authService = ref.read(matchesServiceProvider);

  @override
  FutureOr<MatchInfoModel?> build(String matchId) async {
    // TODO key here is not to await - if we await, null will be returned
    _onLoadMatchInfo(matchId);
    return null;
  }

  // TODO not sure i need this
  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  Future<void> _onLoadMatchInfo(String matchId) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final MatchInfoModel matchInfoModel =
          await authService.getMatchInfo(matchId);

      return matchInfoModel;
    });
  }

// TODO this works in combi with bel,o returning one, but what about error handling
  // @override
  // FutureOr<MatchInfoModel?> build(String matchId) async {
  //   final MatchInfoModel? value = await _onLoadMatchInfo(matchId);
  //   return value;
  // }
// TODO this works easy, but what about error handling
  // Future<MatchInfoModel?> _onLoadMatchInfo(String matchId) async {
  //   try {
  //     final MatchInfoModel matchInfoModel =
  //         await authService.getMatchInfo(matchId);

  //     return matchInfoModel;
  //   } catch (e) {}
  //   return null;
  // }
}
