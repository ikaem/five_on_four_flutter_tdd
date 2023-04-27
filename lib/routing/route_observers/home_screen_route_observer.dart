import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreenRouteObserver extends NavigatorObserver {
  HomeScreenRouteObserver({
    required this.onPopToHomeScreen,
  });

  final VoidCallback onPopToHomeScreen;

// TOOD this will need to be implemented in tests too
  @override
  void didPop(
    Route<dynamic> previousRoute,
    Route<dynamic>? currentRoute,
  ) {
    final bool isCurrentRouteHomeScreen =
        currentRoute?.settings.name == AppRoutes.homeScreenRouteValue.name;
    if (isCurrentRouteHomeScreen) {
// TODO not sure about await
      onPopToHomeScreen();
    }
    ;

    super.didPop(previousRoute, currentRoute);
  }
}
