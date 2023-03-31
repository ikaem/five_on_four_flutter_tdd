import 'package:five_on_four_flutter_tdd/core/routing/app_router.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/providers/auth_status_controller_provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/controller.dart';
import 'package:five_on_four_flutter_tdd/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext widgetContext, WidgetRef ref) {
    final AuthController authController = ref.watch(authControllerProvider);
    final AppRouter appRouter = AppRouter(authController: authController);
    // final AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
    );

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
}
