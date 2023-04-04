
// class MockAppRouter implements AppRouter {
//   MockAppRouter({
//     required this.initialAppRoute,
//     required this.routes,
//   });

//   final AppRouteValue initialAppRoute;
//   final List<GoRoute> routes;

//   late final GoRouter router = GoRouter(
//     initialLocation: initialAppRoute.path,
//     routes: routes,
//   );

//   static GoRoute createGoRoute({
//     required AppRouteValue appRouteValue,
//     required Widget screen,
//   }) {
//     final GoRoute route = GoRoute(
//       path: appRouteValue.path,
//       builder: (context, state) => screen,
//     );

//     return route;
//   }
// }
