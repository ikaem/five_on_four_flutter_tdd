import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/app_controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/overlay_suppport_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/routing/app_router.dart';

import 'package:five_on_four_flutter_tdd/l10n/l10n.dart';
import 'package:five_on_four_flutter_tdd/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late final AuthStatusNewAppController authContoller =
      ref.read(authStatusNewAppControllerProvider);
  late final InitialDataAppController initialDataAppController =
      ref.read(initialDataAppControllerProvider.notifier);

  // TODO these are kinda services and should be in a services folder, or something like that
  late final OverlaySupportWrapper overlaySupportWrapper =
      ref.read(overlaySupportWrapperProvider);

  late final AppRouter appRouter = AppRouter(
    authController: authContoller,
    onPopToHomeScreen: initialDataAppController.onLoadInitialData,
  );

  @override
  Widget build(BuildContext widgetContext) {
    return overlaySupportWrapper.globalWrap(
      MaterialApp.router(
        debugShowCheckedModeBanner: false,
        restorationScopeId: AppConstants.restorationScopeId,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routeInformationProvider: appRouter.router.routeInformationProvider,
        routeInformationParser: appRouter.router.routeInformationParser,
        routerDelegate: appRouter.router.routerDelegate,
      ),
    );
  }
}
