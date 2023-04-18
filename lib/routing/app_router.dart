import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/controller.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter({
    required AuthStatusNewController authController,
    // required this.authStatus,
    // required this.widgetRef,
  }) : _authController = authController;
  // }) : authStatus = authStatus;
  final AuthStatusNewController _authController;

  // final WidgetRef widgetRef;

  // final AsyncValue<AuthModel?> authStatus;
  // late AsyncValue<AuthModel?> authStatus =
  //     widgetRef.watch(authStatusAppControllerProvider);

  late final GoRouter router = GoRouter(
    refreshListenable: _authController,

    // navigatorKey: rootNavigatorKey,
    // TODO not sure if this is needed at a ll
    initialLocation: AppRoutes.splashScreenRouteValue.path,
    routes: [
      // _shellRoute,
      AppRoutes.splashRoute,
      AppRoutes.loginRoute,
      AppRoutes.registerRoute,
      AppRoutes.mainRoute,
      AppRoutes.homeRoute,
      AppRoutes.matchInfoRoute,
      AppRoutes.errorRoute,
      AppRoutes.matchCreateRoute,
      // _matchRoute,
      // _matchCreateRoute,
    ],
    redirect: (context, state) {
      // final bool isLoading = authStatus is AsyncLoading;
      final bool isLoading = _authController.isLoading;
      final bool isAuthenticated = _authController.isAuthenticated;
      final bool isNotAuthenticated = !_authController.isAuthenticated;

      // final bool isAuthenticated =
      //     authStatus is AsyncData && authStatus.value != null;
      // final bool isNotAuthenticated =
      //     authStatus is AsyncData && authStatus.value == null;

      if (isLoading) return AppRoutes.splashScreenPath;

      if (isNotAuthenticated) {
        // conver this to functiona for readability
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
            return AppRoutes.mainScreenPath;

          default:
            return state.location;
        }
      }

      return null;
    },
//     redirect: (context, state) {
//       final bool isAuthenticated = authStatus is Auth
//       final bool isLoading = _authController.isLoading;

//       if (isLoading) return AppRoutes.splashScreenPath;
//       // if (isAuthenticated) return AppRoutes.loginScreenPath;

//       // return AppRoutes.mainScreenPath;

// // TODO test only
//       if (!isAuthenticated) {
//         // conver this to functiona for readability
//         switch (state.location) {
//           case AppRoutes.registerScreenPath:
//             return AppRoutes.registerScreenPath;

//           default:
//             return AppRoutes.loginScreenPath;
//         }
//       }

//       // if (!isAuthenticated) {
//       //   // conver this to functiona for readability
//       //   switch (state.location) {
//       //     case AppRoutes.registerScreenPath:
//       //       return AppRoutes.registerScreenPath;

//       //     default:
//       //       return AppRoutes.loginScreenPath;
//       //   }
//       // }

//       // if (isAuthenticated) {
//       switch (state.location) {
//         case AppRoutes.loginScreenPath:
//         case AppRoutes.registerScreenPath:
//         case AppRoutes.splashScreenPath:
//           return AppRoutes.mainScreenPath;

//         default:
//           return state.location;
//       }
//       // }

//       // return null;

//       // return null;
    // },
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
