import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/application/services/players_get/service.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class PlayerInfoGetController extends _$PlayerInfoGetController {
  PlayersService get playersService => ref.read(playersAppServiceProvider);

  // TODO we try just with notifier
  AsyncValue<PlayerModel> build(String playerId) {
    _onLoadPlayerInfo();

    return AsyncValue.loading();
  }

  Future<void> _onLoadPlayerInfo() async {
    // state = AsyncValue.loading();

    try {
      final PlayerModel playerModel =
          await playersService.handleGetPlayer(playerId);

      state = AsyncValue.data(playerModel);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
