// import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/core/domain/values/app_route/value.dart';
// import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/error/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/home/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/preferences/screen.dart';

// import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/splash/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
// import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_create/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_info/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/matches/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/players/presentation/screens/player_info/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/players/presentation/screens/players/screen.dart';

// import 'package:five_on_four_flutter_tdd/routing/app_routing_scaffold.dart';
// import 'package:go_router/go_router.dart';

// // as per https://snehmehta.medium.com/dynamic-bottom-navigation-with-go-router-flutter-power-series-part-1-2437e2d72546
// // https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/
// // https://www.kodeco.com/28987851-flutter-navigator-2-0-using-go_router

// abstract class AppRoutes {
//   static const String idPlaceholder = ':id';
//   static const String errorMessagePlaceholder = ':error_message';

//   static const splashScreenPath = '/root';
//   // static const mainScreenPath = '/main';
//   static const loginScreenPath = '/login';
//   static const registerScreenPath = '/register';
//   static const homeScreenPath = 'home';
//   static const matchInfoScreenPath = 'matchInfo/$idPlaceholder';
//   static const errorScreenPath = '/error/$errorMessagePlaceholder';
//   static const matchCreateScreenPath = 'match_create';
//   static const matchesScreenPath = 'matches';
//   static const playersScreenPath = 'players';
//   static const preferencesScreenPath = 'preferences';
//   static const playerInfoScreenPath = 'playerInfo/$idPlaceholder';

//   static AppRouteValue get splashScreenRouteValue => const AppRouteValue(
//         path: '$splashScreenPath',
//         name: 'Splash',
//       );

//   static AppRouteValue get loginScreenRouteValue => const AppRouteValue(
//         path: '$loginScreenPath',
//         name: 'Login',
//       );

//   static AppRouteValue get registerScreenRouteValue => const AppRouteValue(
//         path: '$registerScreenPath',
//         name: 'Register',
//       );
//   static AppRouteValue get homeScreenRouteValue => const AppRouteValue(
//         path: '$homeScreenPath',
//         name: 'Home',
//       );

//   static AppRouteValue get matchInfoScreenRouteValue => const AppRouteValue(
//         path: '$matchInfoScreenPath',
//         name: 'MatchInfo',
//       );

//   static AppRouteValue get errorScreenRouteValue => const AppRouteValue(
//         path: '$errorScreenPath',
//         name: 'Error',
//       );

//   static AppRouteValue get matchCreateScreenRouteValue => const AppRouteValue(
//         path: '$matchCreateScreenPath',
//         name: 'MatchCreate',
//       );

//   static AppRouteValue get matchesScreenRouteValue => const AppRouteValue(
//         path: '$matchesScreenPath',
//         name: 'Matches',
//       );

//   static AppRouteValue get playersScreenRouteValue => const AppRouteValue(
//         path: '$playersScreenPath',
//         name: 'Players',
//       );

//   static AppRouteValue get playerInfoScreenRouteValue => const AppRouteValue(
//         path: '$playerInfoScreenPath',
//         name: 'PlayerInfo',
//       );
//   static AppRouteValue get preferencesScreenRouteValue => const AppRouteValue(
//         path: '$preferencesScreenPath',
//         name: 'Preferences',
//       );

//   static final GoRoute splashRoute = GoRoute(
//       path: AppRoutes.splashScreenRouteValue.path,
//       name: AppRoutes.splashScreenRouteValue.name,
//       // builder: (context, state) => SplashScreen(),
//       pageBuilder: (context, state) {
//         // final String? message = state.pathParameters["error_message"];
//         return NoTransitionPage<void>(
//           key: state.pageKey,
//           name: state.name,
//           child: SplashScreen(),
//         );
//       },
//       routes: [
//         AppRoutes.shellRoute,
//         // AppRoutes.loginRoute,
//         // AppRoutes.registerRoute,
//         AppRoutes.matchInfoRoute,
//         AppRoutes.playerInfoRoute,
//         // AppRoutes.errorRoute,
//         AppRoutes.matchCreateRoute,
//       ]);

//   static final GoRoute loginRoute = GoRoute(
//     path: AppRoutes.loginScreenRouteValue.path,
//     name: AppRoutes.loginScreenRouteValue.name,
//     builder: (context, state) => const LoginScreen(),
//   );

//   static final GoRoute registerRoute = GoRoute(
//     path: AppRoutes.registerScreenRouteValue.path,
//     name: AppRoutes.registerScreenRouteValue.name,
//     builder: (context, state) => const RegisterScreen(),
//   );

//   static final GoRoute matchInfoRoute = GoRoute(
//     path: AppRoutes.matchInfoScreenRouteValue.path,
//     name: AppRoutes.matchInfoScreenRouteValue.name,
//     builder: (context, state) {
//       final String? matchId = state.pathParameters["id"];
//       if (matchId == null) {
//         return ErrorScreen(
//             message:
//                 "Invalid match id supplied when navigating to MatchInfo Screen");
//       }

//       return MatchInfoScreen(
//         matchId: matchId,
//       );
//     },
//   );

//   static final GoRoute playerInfoRoute = GoRoute(
//     path: AppRoutes.playerInfoScreenRouteValue.path,
//     name: AppRoutes.playerInfoScreenRouteValue.name,
//     builder: (context, state) {
//       final String? playerId = state.pathParameters["id"];
//       if (playerId == null) {
//         return ErrorScreen(
//             message:
//                 "Invalid player id supplied when navigating to PlayerInfo Screen");
//       }

//       return PlayerInfoScreen(
//         playerId: playerId,
//       );
//     },
//   );

//   static final GoRoute errorRoute = GoRoute(
//     path: AppRoutes.errorScreenRouteValue.path,
//     name: AppRoutes.errorScreenRouteValue.name,
//     pageBuilder: (context, state) {
//       final String? message = state.pathParameters["error_message"];
//       return NoTransitionPage<void>(
//         key: state.pageKey,
//         name: state.name,
//         child: ErrorScreen(message: message),
//       );
//     },
//     // builder: (context, state) {
//     //   final String? message = state.pathParameters["error_message"];

//     //   return ErrorScreen(message: message);
//     // },
//   );

//   static final GoRoute matchCreateRoute = GoRoute(
//     path: AppRoutes.matchCreateScreenRouteValue.path,
//     name: AppRoutes.matchCreateScreenRouteValue.name,
//     // builder: (context, state) => MatchCreateScreen(),
//     pageBuilder: (context, state) {
//       return NoTransitionPage<void>(
//         key: state.pageKey,
//         name: state.name,
//         child: MatchCreateScreen(),
//       );
//     },
//   );

//   static final ShellRoute shellRoute = ShellRoute(
//     navigatorKey: KeysConstants.shellNavigatorKey,
//     builder: (context, state, child) =>
//         AppRoutingScaffold(currentSubrouteWidgetContent: child),
//     routes: [
//       homeRoute,
//       matchesRoute,
//       playersRoute,
//       preferencesRoute,
//     ],
//   );

//   static final GoRoute homeRoute = GoRoute(
//       path: AppRoutes.homeScreenRouteValue.path,
//       name: AppRoutes.homeScreenRouteValue.name,
//       // builder: (context, state) => const HomeScreen(),
//       pageBuilder: (context, state) {
//         return NoTransitionPage<void>(
//           key: state.pageKey,
//           name: state.name,
//           child: HomeScreen(),
//         );
//       },
//       routes: [
//         // matchInfoRoute,
//         // playerInfoRoute,
//         // errorRoute,
//         // matchCreateRoute,
//       ]);

//   static final GoRoute matchesRoute = GoRoute(
//     path: AppRoutes.matchesScreenRouteValue.path,
//     name: AppRoutes.matchesScreenRouteValue.name,
//     builder: (context, state) => MatchesScreen(),
//   );

//   static final GoRoute playersRoute = GoRoute(
//     path: AppRoutes.playersScreenRouteValue.path,
//     name: AppRoutes.playersScreenRouteValue.name,
//     builder: (context, state) => PlayersScreen(),
//   );

//   static final GoRoute preferencesRoute = GoRoute(
//     path: AppRoutes.preferencesScreenRouteValue.path,
//     name: AppRoutes.preferencesScreenRouteValue.name,
//     builder: (context, state) => PreferencesScreen(),
//   );
// }
