import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/logout/controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "provider.g.dart";

// TODO not sure if i should keep this alive - i think not for now, but it might change
@riverpod
class LogoutAppController extends _$LogoutAppController
    implements LogoutController {
  late final AuthService _authService = ref.read(authServiceProvider);

  @override
  AsyncValue<void> build() {
    // TODO not sure if this ok - i guess it is - we wont render anyhting anyhow
    return AsyncValue.data(null);
  }

  @override
  void dispose() {
    // TODO we probably dont need this
  }

  @override
  Future<void> onLogout() async {
    state = AsyncValue.loading();

    await _authService.logout();

    state = AsyncValue.data(null);
  }
}
