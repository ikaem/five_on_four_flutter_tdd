import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutingScaffold extends StatefulWidget {
  const AppRoutingScaffold({
    super.key,
    required this.currentSubrouteWidgetContent,
  });

  final Widget currentSubrouteWidgetContent;

  @override
  State<AppRoutingScaffold> createState() => _AppRoutingScaffoldState();
}

class _AppRoutingScaffoldState extends State<AppRoutingScaffold> {
// TODO want this to be stateful to be able to pass context to the funciton, but also so as not to rebuild widget everytime? or that would be ok?
  int get _currentIndex => _generateBarIndexFromLocation(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.currentSubrouteWidgetContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: _onBarItemTap(context),
      ),
    );
  }

  void Function(int index) _onBarItemTap(BuildContext context) => (int index) {
        // TODO this could be a bit more elegant - to have a list of raw woutes somewhere
        // if()

        if (index == 0) context.goNamed(AppRoutes.homeScreenRouteValue.name);
        if (index == 1) context.goNamed(AppRoutes.matchesScreenRouteValue.name);
        if (index == 2) context.goNamed(AppRoutes.playersScreenRouteValue.name);
      };

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: AppRoutes.homeScreenRouteValue.name,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.sports_soccer),
      label: AppRoutes.matchesScreenRouteValue.name,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.directions_run),
      label: AppRoutes.playersScreenRouteValue.name,
    ),
  ];

  int _generateBarIndexFromLocation(BuildContext context) {
    final GoRouter router = GoRouter.of(context);
    final String location = router.location;

    final homePath = AppRoutes.homeScreenRouteValue.path;
    final matchesPath = AppRoutes.matchesScreenRouteValue.path;
    final playersPath = AppRoutes.playersScreenRouteValue.path;

    if (location == homePath) return 0;
    if (location == matchesPath) return 1;
    if (location == playersPath) return 2;

    return 0;
  }
}
