import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/application/services/matches/service.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_info_get/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class MatchInfoGetAppController extends _$MatchInfoGetAppController
    implements MatchInfoGetController {
  late final MatchesService matchesService = ref.read(matchesServiceProvider);

  @override
  FutureOr<MatchInfoModel?> build(String matchId) async {
    // TODO key here is not to await - if we await, loading will be set to state initially
    // TODO this could potentually be Notifier as well
    _onLoadMatchInfo();
    return null;
  }

  @override
  Future<void> onReloadMatch() async => _onLoadMatchInfo();

  Future<void> _onLoadMatchInfo() async {
    state = AsyncValue.loading();

    try {
      final MatchInfoModel matchInfoModel =
          await matchesService.handleGetMatchInfo(matchId);

      state = AsyncValue.data(matchInfoModel);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
