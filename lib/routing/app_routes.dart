import 'package:five_on_four_flutter_tdd/features/core/domain/values/app_route/value.dart';

abstract class AppRoutes {
  static const String idPlaceholder = ':id';

  static const splashScreenPath = '/';
  static const mainScreenPath = '/main';
  static const loginScreenPath = '/login';
  static const registerScreenPath = '/register';
  static const homeScreenPath = '/home';
  // static const matchesScreenPath = '/matches';
  // static const playersScreenPath = '/players';
  // static const matchCreateScreenPath = '/match-create';

  static AppRouteValue get splashScreenRoute => const AppRouteValue(
        path: '$splashScreenPath',
        name: 'Splash',
      );

  static AppRouteValue get mainScreenRoute => const AppRouteValue(
        path: '$mainScreenPath',
        name: 'Main',
      );

  static AppRouteValue get loginScreenRoute => const AppRouteValue(
        path: '$loginScreenPath',
        name: 'Login',
      );

  static AppRouteValue get registerScreenRoute => const AppRouteValue(
        path: '$registerScreenPath',
        name: 'Register',
      );
  static AppRouteValue get homeScreenRoute => const AppRouteValue(
        path: '$homeScreenPath',
        name: 'Home',
      );

  // static AppRouteValue get matches => const AppRouteValue(
  //       path: '$matchesPath',
  //       name: 'Matches',
  //     );

  // static AppRouteValue get players => const AppRouteValue(
  //       path: '$playersPath',
  //       name: 'Players',
  //     );

  // static AppRouteValue get matchCreate => const AppRouteValue(
  //       path: '$matchCreatePath',
  //       name: 'MatchCreate',
  //     );

  // static AppRouteValue get splash => const AppRouteValue(
  //       path: '$splashPath',
  //       name: 'Splash',
  //     );

  // static AppRouteValue match([String? id]) {
  //   final String matchId = id ?? idPlaceholder;

  //   return AppRouteValue(
  //     path: '$matchesPath/$matchId',
  //     name: 'Match',
  //   );
  // }

  // static AppRouteValue player([String? id]) {
  //   final String player = id ?? idPlaceholder;

  //   return AppRouteValue(
  //     path: '$playersPath/$player',
  //     name: 'Player',
  //   );
  // }
}
