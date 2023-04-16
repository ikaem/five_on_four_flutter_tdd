import 'package:five_on_four_flutter_tdd/features/core/domain/values/app_route/value.dart';
import 'package:go_router/go_router.dart';

class MockAppRouter {
  MockAppRouter({
    required this.initialAppRoute,
    required this.routes,
  });

  final AppRouteValue initialAppRoute;
  final List<GoRoute> routes;

  late final GoRouter router = GoRouter(
    initialLocation: initialAppRoute.path,
    routes: routes,
  );

// TODO not needed
  // static GoRoute createGoRoute({
  //   required AppRouteValue appRouteValue,
  //   // required Widget screen,
  //   required Widget Function(BuildContext, GoRouterState)? builder,
  // }) {
  //   final GoRoute route = GoRoute(
  //     path: appRouteValue.path,
  //     builder: builder,
  //     // builder: (context, state) => screen,
  //   );

  //   return route;
  // }

  // @override
  // AsyncValue<AuthModel?> authStatus;

  // @override
  // // TODO: implement widgetRef
  // WidgetRef get widgetRef => throw UnimplementedError();
}
