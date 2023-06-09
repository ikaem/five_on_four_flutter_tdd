import 'dart:developer';

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
    return const AsyncData(null);
    // return AsyncValue.error("", StackTrace.current);
  }

  @override
  Future<void> onDeleteAccount() async {
    state = AsyncValue.loading();

    try {
      await _playerPreferencesService.handleDeleteAccount();
      // TODO this should probably return true or false or something, just se we can tell difference in ui dialog for delete
      state = AsyncValue.data(null);
      // state = AsyncValue.error("", StackTrace.current);
    } catch (e) {
      log("Error deleting account", error: e);
// TODO we can specify which error happened maybe?
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  @override
  void onResetState() {
    state = const AsyncValue.data(null);
  }

// TODO not sure we need this
  @override
  void dispose() {}
}
