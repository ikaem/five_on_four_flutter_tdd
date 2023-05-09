import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/logout/controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/logout/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/enums/app_bar_more_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarMoreActions extends ConsumerWidget {
  const AppBarMoreActions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LogoutController logoutController =
        ref.read(logoutAppControllerProvider.notifier);

    return PopupMenuButton<AppBarMoreAction>(
      onSelected: (AppBarMoreAction value) {
// TOOD will retrieve the provider from here
        switch (value) {
          case AppBarMoreAction.logout:
            logoutController.onLogout();
            break;

          default:
            return;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<AppBarMoreAction>(
            value: AppBarMoreAction.logout,
            child: Text("Logout"),
          )
        ];
      },
    );
  }
}
