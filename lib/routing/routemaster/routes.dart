import 'package:five_on_four_flutter_tdd/features/auth/domain/models/auth/model.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/app_route/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/error/screen.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/home/screen.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/preferences/screen.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/splash/screen.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_create/screen.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_info/screen.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/matches/screen.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/screens/player_info/screen.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/screens/players/screen.dart';
import 'package:five_on_four_flutter_tdd/routing/routemaster/bottom_bar_routing_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import "package:firebase_analytics/firebase_analytics.dart";

class MyObserver extends RoutemasterObserver {
  // RoutemasterObserver extends NavigatorObserver and
  // receives all nested Navigator events
  @override
  void didPop(Route route, Route? previousRoute) {
    print('Popped a route');
  }

  // Routemaster-specific observer method
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    FirebaseAnalytics.instance.logScreenView(
      screenName: routeData.fullPath,
    );

    print('New route: ${routeData.path}');
  }
}

class RouteMasterRouter {
  RouteMasterRouter();

  // final AsyncValue<AuthModel?> _authStatus;

  // late final RoutemasterDelegate delegate = RoutemasterDelegate(
  //   routesBuilder: (context) {
  //     // final isAuthenticated = _authStatusController.isAuthenticated;
  //     // final RouteMap routesMap =
  //     //     isAuthenticated ? _authenticatedRoutesMap : _unauthenticatedRoutesMap;

  //     return _unauthenticatedRoutesMap;
  //   },
  //   observers: [
  //     MyObserver(),
  //   ],
  // );

  RoutemasterDelegate getDelegate({
    required AsyncValue<AuthModel?> authStatus,
  }) {
    return RoutemasterDelegate(
      routesBuilder: (context) {
        return authStatus.when<RouteMap>(
          data: (data) {
            final bool isAuthenticated = data != null;
            final RouteMap routesMap = isAuthenticated
                ? _authenticatedRoutesMap
                : _unauthenticatedRoutesMap;

            return routesMap;
          },
          error: (error, stackTrace) => _errorMap,
          loading: () => _loadingMap,
        );
        // final bool isAuthenticated = authStatus.maybeWhen(
        //   orElse: () => false,
        //   data: (data) => data != null,
        // );

        // final RouteMap routesMap = isAuthenticated
        //     ? _authenticatedRoutesMap
        //     : _unauthenticatedRoutesMap;

        // return routesMap;
      },
      observers: [
        MyObserver(),
      ],
    );
  }

  final RouteMap _errorMap = RouteMap(
    onUnknownRoute: (path) => MaterialPage<Widget>(
        child: ErrorScreen(
      message: null,
    )),
    routes: {},
  );

  final RouteMap _loadingMap = RouteMap(
    onUnknownRoute: (path) => MaterialPage<Widget>(child: SplashScreen()),
    routes: {},
  );

  final RouteMap _unauthenticatedRoutesMap = RouteMap(
    onUnknownRoute: (path) => Redirect(Routes.loginScreenRoute.path),
    routes: {
      // Routes.rootRoute.path: (_) => MaterialPage<Widget>(child: SplashScreen()),
      Routes.rootRoute.path: (_) => Redirect(Routes.loginScreenRoute.path),
      Routes.loginScreenRoute.path: (_) => MaterialPage<Widget>(
            child: LoginScreen(),
          ),
      Routes.registerScreenRoute.path: (_) => MaterialPage<Widget>(
            child: RegisterScreen(),
          ),
    },
  );

  final RouteMap _authenticatedRoutesMap = RouteMap(
    onUnknownRoute: (path) {
      return Redirect(Routes.mainScreenRoute.path);
    },
    routes: {
      // Routes.rootRoute.path: (_) => MaterialPage<Widget>(child: SplashScreen()),
      Routes.mainScreenRoute.path: (_) {
        return TabPage(
          child: BottomBarRoutingScaffold(),
          paths: [
            Routes.homeScreenRoute.path,
            Routes.matchesScreenRoute.path,
            Routes.playersScreenRoute.path,
            Routes.preferencesScreenRoute.path,
          ],
        );
      },
      Routes.matchInfoScreenRoute.path: (RouteData route) {
        // handle error if no match id
        return MaterialPage<Widget>(
          child: MatchInfoScreen(matchId: route.pathParameters["id"]!),
        );
      },
      Routes.errorScreenRoute.path: (RouteData route) => MaterialPage<Widget>(
            child: ErrorScreen(message: route.pathParameters['error_message']),
          ),
      Routes.matchCreateScreenRoute.path: (_) {
        return MaterialPage<Widget>(
          child: MatchCreateScreen(),
        );
      },
      // tabbed navigation
      Routes.homeScreenRoute.path: (_) => MaterialPage<Widget>(
            child: HomeScreen(),
          ),
      Routes.matchesScreenRoute.path: (_) => MaterialPage<Widget>(
            child: MatchesScreen(),
          ),
      Routes.playersScreenRoute.path: (_) => MaterialPage<Widget>(
            child: PlayersScreen(),
          ),
      Routes.preferencesScreenRoute.path: (_) => MaterialPage<Widget>(
            child: PreferencesScreen(),
          ),
      Routes.playerInfoScreenRoute.path: (RouteData route) {
        // send to error if no data
        final String id = route.pathParameters['id']!;
        return MaterialPage<Widget>(
          child: PlayerInfoScreen(
            playerId: id,
          ),
        );
      },
    },
  );
}

abstract class Routes {
  static const String idPlaceholder = ':id';
  static const String errorMessagePlaceholder = ':error_message';

  static const loginScreenPath = '/login';
  static const registerScreenPath = '/register';
  static const rootPath = '/';
  static const mainScreenPath = '/main';
  static const homeScreenPath = '/main/home';
  static const matchInfoScreenPath = '/matchInfo/$idPlaceholder';
  static const errorScreenPath = '/error/$errorMessagePlaceholder';
  static const matchCreateScreenPath = '/match_create';
  static const matchesScreenPath = '/main/matches';
  static const playersScreenPath = '/main/players';
  static const preferencesScreenPath = '/main/preferences';
  static const playerInfoScreenPath = '/playerInfo/$idPlaceholder';

  static AppRouteValue get rootRoute => const AppRouteValue(
        path: '$rootPath',
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

  static AppRouteValue get matchInfoScreenRoute => const AppRouteValue(
        path: '$matchInfoScreenPath',
        name: 'MatchInfo',
      );

  static AppRouteValue get errorScreenRoute => const AppRouteValue(
        path: '$errorScreenPath',
        name: 'Error',
      );

  static AppRouteValue get matchCreateScreenRoute => const AppRouteValue(
        path: '$matchCreateScreenPath',
        name: 'MatchCreate',
      );

  static AppRouteValue get matchesScreenRoute => const AppRouteValue(
        path: '$matchesScreenPath',
        name: 'Matches',
      );

  static AppRouteValue get playersScreenRoute => const AppRouteValue(
        path: '$playersScreenPath',
        name: 'Players',
      );

  static AppRouteValue get playerInfoScreenRoute => const AppRouteValue(
        path: '$playerInfoScreenPath',
        name: 'PlayerInfo',
      );
  static AppRouteValue get preferencesScreenRoute => const AppRouteValue(
        path: '$preferencesScreenPath',
        name: 'Preferences',
      );
}
