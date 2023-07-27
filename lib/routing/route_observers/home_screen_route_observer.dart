
// class HomeScreenRouteObserver extends NavigatorObserver {
//   HomeScreenRouteObserver({
//     required this.onPopToHomeScreen,
//   });

//   final VoidCallback onPopToHomeScreen;
//   @override
//   void didPop(
//     Route<dynamic> previousRoute,
//     Route<dynamic>? currentRoute,
//   ) {
//     // TODO this below can be extracted
//     final bool isCurrentRouteHomeScreen =
//         currentRoute?.settings.name == AppRoutes.homeScreenRouteValue.name;
//     if (isCurrentRouteHomeScreen) {
//       onPopToHomeScreen();
//     }
//     ;

//     super.didPop(previousRoute, currentRoute);
//   }

//   @override
//   void didPush(Route route, Route? previousRoute) {
//     // TODO: implement didPush
//     super.didPush(route, previousRoute);
//   }
// }
