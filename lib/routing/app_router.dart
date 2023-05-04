import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/controller.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/routing/route_observers/home_screen_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter({
    required AuthStatusNewController authController,
    required VoidCallback onPopToHomeScreen,
  })  : _authController = authController,
        _onPopToHomeScreen = onPopToHomeScreen;
  final AuthStatusNewController _authController;
  final VoidCallback _onPopToHomeScreen;

  late final GoRouter router = GoRouter(
    refreshListenable: _authController,
// TODO not sure if navigator key is needed
    // navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splashScreenRouteValue.path,
    observers: [
      _homeScreenRouteObserver,
    ],
    routes: [
      // _shellRoute,
      AppRoutes.shellRoute,
      AppRoutes.splashRoute,
      AppRoutes.loginRoute,
      AppRoutes.registerRoute,
      // AppRoutes.homeRoute,
      AppRoutes.matchInfoRoute,
      AppRoutes.playerInfoRoute,
      AppRoutes.errorRoute,
      AppRoutes.matchCreateRoute,
    ],
    redirect: (context, state) {
      final bool isLoading = _authController.isLoading;
      final bool isAuthenticated = _authController.isAuthenticated;
      final bool isNotAuthenticated = !_authController.isAuthenticated;

      if (isLoading) return AppRoutes.splashScreenPath;

      if (isNotAuthenticated) {
        switch (state.location) {
          case AppRoutes.registerScreenPath:
            return AppRoutes.registerScreenPath;

          default:
            return AppRoutes.loginScreenPath;
        }
      }

      if (isAuthenticated) {
        switch (state.location) {
          case AppRoutes.loginScreenPath:
          case AppRoutes.registerScreenPath:
          case AppRoutes.splashScreenPath:
            return AppRoutes.homeScreenRouteValue.path;

          default:
            return state.location;
        }
      }

      return null;
    },
  );
// TODO create abstract class for instnatiated observers
  late final HomeScreenRouteObserver _homeScreenRouteObserver =
      HomeScreenRouteObserver(
    onPopToHomeScreen: _onPopToHomeScreen,
  );
}
