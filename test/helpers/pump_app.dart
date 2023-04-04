
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
