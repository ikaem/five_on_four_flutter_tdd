import 'package:five_on_four_flutter_tdd/core/domain/values/app_route/value.dart';
import 'package:flutter/material.dart';
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

  static GoRoute createGoRoute({
    required AppRouteValue appRouteValue,
    required Widget screen,
  }) {
    final GoRoute route = GoRoute(
      path: appRouteValue.path,
      builder: (context, state) => screen,
    );

    return route;
  }

  // @override
  // AsyncValue<AuthModel?> authStatus;

  // @override
  // // TODO: implement widgetRef
  // WidgetRef get widgetRef => throw UnimplementedError();
}
