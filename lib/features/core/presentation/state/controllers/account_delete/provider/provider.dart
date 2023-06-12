import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/application/services/player_preferences/service.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/account_delete/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

@riverpod
class AccountDeleteAppController extends _$AccountDeleteAppController
    implements AccountDeleteController {
  late final PlayerPreferencesService _playerPreferencesService =
      ref.read(playerPreferencesServiceProvider);

  // TODO we might have some subject here to validate user email if we need th4em to confirm deletion

  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  @override
  Future<void> onDeleteAccount() async {
    state = AsyncValue.loading();

    try {
      await _playerPreferencesService.handleDeleteAccount();
      state = AsyncValue.data(null);
    } catch (e) {
// TODO we can specify which error happened maybe?
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

// TODO not sure we need this
  @override
  void dispose() {}
}
