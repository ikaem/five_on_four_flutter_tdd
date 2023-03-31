// this might or might not be instantiated later
import 'package:five_on_four_flutter_tdd/core/presentation/screens/main/screen.dart';
import 'package:five_on_four_flutter_tdd/core/presentation/screens/splash/screen.dart';
import 'package:five_on_four_flutter_tdd/core/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status/controller.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter({
    required AuthController authController,
  }) : _authController = authController;

  final AuthController _authController;

  late final GoRouter router = GoRouter(
    refreshListenable: _authController,

    // navigatorKey: rootNavigatorKey,
    // TODO not sure if this is needed at a ll
    initialLocation: AppRoutes.splashScreenRoute.path,
    routes: [
      // _shellRoute,
      _splashRoute,
      _loginRoute,
      _registerRoute,
      _mainRoute,
      // _matchRoute,
      // _matchCreateRoute,
    ],
    redirect: (context, state) {
      final bool isAuthenticated = _authController.isAuthenticated;
      final bool isLoading = _authController.isLoading;

      if (isLoading) return AppRoutes.splashScreenPath;
      // if (isAuthenticated) return AppRoutes.loginScreenPath;

      // return AppRoutes.mainScreenPath;

// TODO test only
      if (!isAuthenticated) {
        // conver this to functiona for readability
        switch (state.location) {
          case AppRoutes.registerScreenPath:
            return AppRoutes.registerScreenPath;

          default:
            return AppRoutes.loginScreenPath;
        }
      }

      // if (!isAuthenticated) {
      //   // conver this to functiona for readability
      //   switch (state.location) {
      //     case AppRoutes.registerScreenPath:
      //       return AppRoutes.registerScreenPath;

      //     default:
      //       return AppRoutes.loginScreenPath;
      //   }
      // }

      // if (isAuthenticated) {
      switch (state.location) {
        case AppRoutes.loginScreenPath:
        case AppRoutes.registerScreenPath:
        case AppRoutes.splashScreenPath:
          return AppRoutes.mainScreenPath;

        default:
          return state.location;
      }
      // }

      // return null;

      // return null;
    },
    // refreshListenable: _initialDataProvider,
    // redirect: (context, state) {
    //   if (_initialDataProvider.isLoading) {
    //     return AppRoutes.splashPath;
    //   }

    //   // TODO test
    //   if (!_initialDataProvider.isInitialDataLoadedSuccessfully) {
    //     switch (state.location) {
    //       case AppRoutes.registerPath:
    //         return AppRoutes.registerPath;
    //       default:
    //         return AppRoutes.loginPath;
    //     }
    //   }

    //   if (state.location == AppRoutes.loginPath) {
    //     return AppRoutes.homePath;
    //   }

    //   return state.location;
    // },
  );

  // late final ShellRoute _shellRoute = ShellRoute(
  //   // navigatorKey: shellNavigatorKey,
  //   // TODO this child is what will be returned from each go route
  //   builder: (context, state, child) => AppRoutingScaffold(child: child),
  //   routes: [
  //     _homeRoute,
  //     _playersRoute,
  //     _matchesRoute,
  //   ],
  // );

// TODO make functions form these - and export them from libraries
  // final GoRoute _homeRoute = GoRoute(
  //   path: AppRoutes.home.path,
  //   name: AppRoutes.home.name,
  //   // TODO check if page builder will make .go naivgation actuvate back otpion on screen
  //   builder: (context, state) => const HomeScreen(),
  // );

  final GoRoute _splashRoute = GoRoute(
    path: AppRoutes.splashScreenRoute.path,
    name: AppRoutes.splashScreenRoute.name,
    builder: (context, state) => SplashScreen(),
    // builder: (context, state) {
    // return const Center(
    //   child: CircularProgressIndicator(),
    // );
    // },
  );

  final GoRoute _mainRoute = GoRoute(
    path: AppRoutes.mainScreenRoute.path,
    name: AppRoutes.mainScreenRoute.name,
    // TODO check if page builder will make .go naivgation actuvate back otpion on screen
    builder: (context, state) => const MainScreen(),
  );

  final GoRoute _loginRoute = GoRoute(
    path: AppRoutes.loginScreenRoute.path,
    name: AppRoutes.loginScreenRoute.name,
    // TODO check if page builder will make .go naivgation actuvate back otpion on screen
    builder: (context, state) => const LoginScreen(),
  );

  final GoRoute _registerRoute = GoRoute(
    path: AppRoutes.registerScreenRoute.path,
    name: AppRoutes.registerScreenRoute.name,
    // TODO check if page builder will make .go naivgation actuvate back otpion on screen
    builder: (context, state) => const RegisterScreen(),
  );

  // final GoRoute _playersRoute = GoRoute(
  //   path: AppRoutes.players.path,
  //   name: AppRoutes.players.name,
  //   builder: (context, state) => const PlayersScreen(),
  // );

  // final GoRoute _matchesRoute = GoRoute(
  //   path: AppRoutes.matches.path,
  //   name: AppRoutes.matches.name,
  //   builder: (context, state) => const MatchesScreen(),
  // );

  // final GoRoute _matchRoute = GoRoute(
  //   path: AppRoutes.match().path,
  //   name: AppRoutes.match().name,
  //   builder: (context, state) {
  //     final String matchId = state.params['id']!;

  //     return MatchScreen(
  //       matchId: matchId,
  //     );
  //   },
  // );

  // final GoRoute _matchCreateRoute = GoRoute(
  //   path: AppRoutes.matchCreate.path,
  //   name: AppRoutes.matchCreate.name,
  //   builder: (context, state) {
  //     return const MatchCreateScreen();
  //   },
  // );
}
