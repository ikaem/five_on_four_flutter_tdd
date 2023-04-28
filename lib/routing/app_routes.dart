import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/app_route/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/error/screen.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/home/screen.dart';

import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/splash/screen.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_create/screen.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_info/screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String idPlaceholder = ':id';
  static const String errorMessagePlaceholder = ':error_message';

  static const splashScreenPath = '/';
  static const mainScreenPath = '/main';
  static const loginScreenPath = '/login';
  static const registerScreenPath = '/register';
  static const homeScreenPath = '/home';
  static const matchInfoScreenPath = '/matchInfo/$idPlaceholder';
  static const errorScreenPath = '/error/$errorMessagePlaceholder';
  static const matchCreateScreenPath = '/match_create';

  static AppRouteValue get splashScreenRouteValue => const AppRouteValue(
        path: '$splashScreenPath',
        name: 'Splash',
      );

  static AppRouteValue get loginScreenRouteValue => const AppRouteValue(
        path: '$loginScreenPath',
        name: 'Login',
      );

  static AppRouteValue get registerScreenRouteValue => const AppRouteValue(
        path: '$registerScreenPath',
        name: 'Register',
      );
  static AppRouteValue get homeScreenRouteValue => const AppRouteValue(
        path: '$homeScreenPath',
        name: 'Home',
      );

  static AppRouteValue get matchInfoScreenRouteValue => const AppRouteValue(
        path: '$matchInfoScreenPath',
        name: 'MatchInfo',
      );

  static AppRouteValue get errorScreenRouteValue => const AppRouteValue(
        path: '$errorScreenPath',
        name: 'Error',
      );

  static AppRouteValue get matchCreateScreenRouteValue => const AppRouteValue(
        path: '$matchCreateScreenPath',
        name: 'MatchCreate',
      );

  static final GoRoute splashRoute = GoRoute(
    path: AppRoutes.splashScreenRouteValue.path,
    name: AppRoutes.splashScreenRouteValue.name,
    builder: (context, state) => SplashScreen(),
  );

  static final GoRoute loginRoute = GoRoute(
    path: AppRoutes.loginScreenRouteValue.path,
    name: AppRoutes.loginScreenRouteValue.name,
    builder: (context, state) => const LoginScreen(),
  );

  static final GoRoute registerRoute = GoRoute(
    path: AppRoutes.registerScreenRouteValue.path,
    name: AppRoutes.registerScreenRouteValue.name,
    builder: (context, state) => const RegisterScreen(),
  );

  static final GoRoute homeRoute = GoRoute(
    path: AppRoutes.homeScreenRouteValue.path,
    name: AppRoutes.homeScreenRouteValue.name,
    builder: (context, state) => const HomeScreen(),
  );

  static final GoRoute matchInfoRoute = GoRoute(
    path: AppRoutes.matchInfoScreenRouteValue.path,
    name: AppRoutes.matchInfoScreenRouteValue.name,
    builder: (context, state) {
      final String? matchId = state.params["id"];
      if (matchId == null) {
        return ErrorScreen(
            message:
                "Invalid match id supplied when navigating to MatchInfo Screen");
      }

      return MatchInfoScreen(
        matchId: matchId,
      );
    },
  );

  static final GoRoute errorRoute = GoRoute(
    path: AppRoutes.errorScreenRouteValue.path,
    name: AppRoutes.errorScreenRouteValue.name,
    builder: (context, state) {
      final String? message = state.params["error_message"];

      return ErrorScreen(message: message);
    },
  );

  static final GoRoute matchCreateRoute = GoRoute(
    path: AppRoutes.matchCreateScreenRouteValue.path,
    name: AppRoutes.matchCreateScreenRouteValue.name,
    builder: (context, state) => MatchCreateScreen(),
  );
}
