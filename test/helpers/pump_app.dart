// lets this one stay becuase of mock navigator observer patterns n

// extension PumpApp on WidgetTester {
//   Future<void> pumpApp(
//       {
//       // required Widget widget,
//       required AppRouter appRouter,
//       List<Override> providerScopeOverrides = const []}

//       // [
//       // NavigatorObserver? mockNavigatorObserver,
//       // ]
//       ) {
//     return pumpWidget(
//       ProviderScope(
//         overrides: providerScopeOverrides,
//         child: MaterialApp.router(
//           // theme: ThemeData(
//           //   appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
//           //   colorScheme: ColorScheme.fromSwatch(
//           //     accentColor: const Color(0xFF13B9FF),
//           //   ),
//           // ),
//           localizationsDelegates: AppLocalizations.localizationsDelegates,
//           supportedLocales: AppLocalizations.supportedLocales,
//           routeInformationProvider: appRouter.router.routeInformationProvider,
//           routeInformationParser: appRouter.router.routeInformationParser,
//           routerDelegate: appRouter.router.routerDelegate,
//         ),
//       ),
//     );

//     // MaterialApp(
//     //   localizationsDelegates: AppLocalizations.localizationsDelegates,
//     //   supportedLocales: AppLocalizations.supportedLocales,
//     //   navigatorObservers: [
//     //     if (mockNavigatorObserver != null) mockNavigatorObserver,
//     //   ],
//     //   home: widget,
//     // ),
//   }
// }
import 'package:five_on_four_flutter_tdd/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

extension PumpAppExtension on WidgetTester {
  Future<void> pumpApp({
    required GoRouter router,
    required List<Override> providerScopeOverrides,
  }) async {
    return pumpWidget(
      ProviderScope(
        overrides: providerScopeOverrides,
        child: MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        ),
      ),
    );
  }
}
