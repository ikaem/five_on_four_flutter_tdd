import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/notifications_listener/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/notification_widget.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/l10n/l10n.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/overlay_suppport_wrapper.dart';
import 'package:five_on_four_flutter_tdd/libraries/overlay_support/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/routing/routemaster/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/routing/routemaster/routes.dart';
import 'package:five_on_four_flutter_tdd/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

// TODO this might not need to be stateful at all
class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  // late final AuthStatusNewAppController authContoller =
  //     ref.read(authStatusNewAppControllerProvider);
  // late final InitialDataAppController initialDataAppController =
  //     ref.read(initialDataAppControllerProvider.notifier);

  // TODO not sure this should be without controller
  late final OverlaySupportWrapper overlaySupportWrapper =
      ref.read(overlaySupportWrapperProvider);

  // late final AppRouter appRouter = AppRouter(
  //   authController: authContoller,
  //   onPopToHomeScreen: initialDataAppController.onLoadInitialData,
  // );

  // TODO test only for now
  // late final RouteMasterRouter routeMasterRouter = RouteMasterRouter();
  late final RouteMasterRouter routeMasterRouter =
      ref.read(routeMasterRouterProvider);

  // late final
  // final RouteMasterRouter routeMasterRouter = RouteMasterRouter();

  @override
  Widget build(BuildContext widgetContext) {
    // late final AppRouter appRouter = ref.read(appRouterProvider);
    // TODO this should be using a widget

    // final AuthStatusNewAppController authContoller =
    //     ref.watch(authStatusNewAppControllerProvider);

    // ref.watch(authStatusControllerImplProvider);

    // return MaterialApp(
    //   home: Text("Hello"),
    // );
    // ref.listen(
    //   notificationsListenerAppControllerProvider,
    //   _onNotificationsListenerListen,
    // );
    // late final RouteMasterRouter routeMasterRouter =
    //     ref.watch(routeMasterRouterProvider);

    final AsyncValue<AuthModel?> authStatus =
        ref.watch(authStatusControllerImplProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: AppConstants.restorationScopeId,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // routerDelegate: routeMasterRouter.delegate,
      routerDelegate: routeMasterRouter.getDelegate(authStatus: authStatus),
      routeInformationParser: RoutemasterParser(),
      // routeInformationProvider: appRouter.router.routeInformationProvider,
      // routeInformationParser: appRouter.router.routeInformationParser,
      // routerDelegate: appRouter.router.routerDelegate,
    );
  }

  void _onNotificationsListenerListen(
    AsyncValue<NotificationEntity?>? previous,
    AsyncValue<NotificationEntity?> next,
  ) {
    next.when(
      data: (data) {
        if (data == null) return;

        overlaySupportWrapper.showNotificationWidget(
          NotificationWidget(
            body: data.body,
            title: data.title,
          ),
        );
      },
      error: (error, stackTrace) =>
          overlaySupportWrapper.showNotificationWidget(
        NotificationWidget.error(
          body: "",
          title: "Error showing notification",
        ),
      ),
      loading: () => null,
    );
  }
}
