import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreenRouteObserver extends NavigatorObserver {
  HomeScreenRouteObserver({
    required this.onPopToHomeScreen,
  });

  final VoidCallback onPopToHomeScreen;
  @override
  void didPop(
    Route<dynamic> previousRoute,
    Route<dynamic>? currentRoute,
  ) {
    final bool isCurrentRouteHomeScreen =
        currentRoute?.settings.name == AppRoutes.homeScreenRouteValue.name;
    if (isCurrentRouteHomeScreen) {
      onPopToHomeScreen();
    }
    ;

    super.didPop(previousRoute, currentRoute);
  }
}
