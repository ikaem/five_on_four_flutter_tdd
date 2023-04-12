import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_info_get/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class MatchInfoGetAppController extends _$MatchInfoGetAppController
    implements MatchInfoGetController {
  // TODO this is not possible
  // MatchInfoGetAppController({
  //   required this.matchId,
  // });

  // final String matchId;

  late final MatchesService authService = ref.read(matchesServiceProvider);

  @override
  Future<MatchInfoModel?> build(String matchId) async {
    // final AsyncValue<MatchInfoModel> result = await _onLoadMatchInfo(matchId);
    await _onLoadMatchInfo(matchId);
    return null;

    // return result.value;
  }

  // TODO not sure i need this
  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  Future<void> _onLoadMatchInfo(String matchId) async {
    final AsyncValue<MatchInfoModel> result = await AsyncValue.guard(
      () async {
        final MatchInfoModel matchInfoModel =
            await authService.getMatchInfo(matchId);

        return matchInfoModel;
      },
    );

    state = result;
  }
}
