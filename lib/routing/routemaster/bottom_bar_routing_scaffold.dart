import 'package:five_on_four_flutter_tdd/routing/routemaster/routes.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

// TODO porbably rename ths at some point - to main screne possibliy - and then move to core?
class BottomBarRoutingScaffold extends StatelessWidget {
  const BottomBarRoutingScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final tabPage = TabPage.of(context);

    return Scaffold(
      body: PageStackNavigator(
        stack: tabPage.stacks[tabPage.index],
      ),
      bottomNavigationBar: TabBar(controller: tabPage.controller, tabs: [
        Tab(
          icon: const Icon(Icons.home),
          text: Routes.homeScreenRoute.name,
        ),
        Tab(
          icon: const Icon(Icons.sports_soccer),
          text: Routes.matchesScreenRoute.name,
        ),
        Tab(
          icon: const Icon(Icons.directions_run),
          text: Routes.playersScreenRoute.name,
        ),
        Tab(
          icon: const Icon(Icons.person),
          text: Routes.preferencesScreenRoute.name,
        ),
      ]),
    );
  }
}
