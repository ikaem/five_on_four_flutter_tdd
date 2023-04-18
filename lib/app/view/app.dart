import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/app_controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/providers/provider.dart';
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
  // late final AsyncValue<AuthModel?> authStatus =
  //     ref.watch(authStatusAppControllerProvider);

  late final AuthStatusNewAppController authContoller =
      ref.read(authStatusNewAppControllerProvider);

  late final AppRouter appRouter = AppRouter(
    // authStatus: authStatus,
    authController: authContoller,
    // widgetRef: ref,
  );

  @override
  Widget build(BuildContext widgetContext) {
    // final AuthStatusNewAppController authContoller =
    //     ref.watch(authStatusNewAppControllerProvider);

    // final AppRouter appRouter = AppRouter(
    //   // authStatus: authStatus,
    //   authController: authContoller,
    //   // widgetRef: ref,
    // );

    // final AsyncValue<AuthModel?> authStatus =
    //     ref.watch(authStatusAppControllerProvider);

    // final AppRouter appRouter = AppRouter(
    //   authStatus: authStatus,
    //   // widgetRef: ref,
    // );
    // final AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      // TODO make this a constant
      restorationScopeId: 'five_on_4_app',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
    );
  }

  // return MaterialApp(
  //   theme: ThemeData(
  //     appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
  //     colorScheme: ColorScheme.fromSwatch(
  //       accentColor: const Color(0xFF13B9FF),
  //     ),
  //   ),
  //   localizationsDelegates: AppLocalizations.localizationsDelegates,
  //   supportedLocales: AppLocalizations.supportedLocales,
  //   home: const LoginScreen(),
  // );
}

// class App extends ConsumerWidget {
//   // const App({super.key});

//   @override
//   Widget build(BuildContext widgetContext, WidgetRef ref) {
//     final AsyncValue<AuthModel?> authStatus =
//         ref.watch(authStatusAppControllerProvider);

//     final AppRouter appRouter = AppRouter(
//       authStatus: authStatus,
//       // widgetRef: ref,
//     );
//     // final AppRouter appRouter = AppRouter();

//     return MaterialApp.router(
//       // TODO make this a constant
//       restorationScopeId: 'five_on_4_app',
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: ThemeMode.light,
//       localizationsDelegates: AppLocalizations.localizationsDelegates,
//       supportedLocales: AppLocalizations.supportedLocales,
//       routeInformationProvider: appRouter.router.routeInformationProvider,
//       routeInformationParser: appRouter.router.routeInformationParser,
//       routerDelegate: appRouter.router.routerDelegate,
//     );

//     // return MaterialApp(
//     //   theme: ThemeData(
//     //     appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//     //     colorScheme: ColorScheme.fromSwatch(
//     //       accentColor: const Color(0xFF13B9FF),
//     //     ),
//     //   ),
//     //   localizationsDelegates: AppLocalizations.localizationsDelegates,
//     //   supportedLocales: AppLocalizations.supportedLocales,
//     //   home: const LoginScreen(),
//     // );
//   }
// }
