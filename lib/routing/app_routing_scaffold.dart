
// class AppRoutingScaffold extends StatefulWidget {
//   const AppRoutingScaffold({
//     super.key,
//     required this.currentSubrouteWidgetContent,
//   });

//   final Widget currentSubrouteWidgetContent;

//   @override
//   State<AppRoutingScaffold> createState() => _AppRoutingScaffoldState();
// }

// class _AppRoutingScaffoldState extends State<AppRoutingScaffold> {
//   int get _currentIndex => _generateBarIndexFromLocation(context);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.currentSubrouteWidgetContent,
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: ColorConstants.red,
//         unselectedItemColor: ColorConstants.yellow,
//         currentIndex: _currentIndex,
//         items: _bottomNavigationBarItems,
//         onTap: _onBarItemTap(context),
//       ),
//     );
//   }

//   void Function(int index) _onBarItemTap(BuildContext context) => (int index) {
//         if (index == 0) context.goNamed(AppRoutes.homeScreenRouteValue.name);
//         if (index == 1) context.goNamed(AppRoutes.matchesScreenRouteValue.name);
//         if (index == 2) context.goNamed(AppRoutes.playersScreenRouteValue.name);
//         if (index == 3)
//           context.goNamed(AppRoutes.preferencesScreenRouteValue.name);
//       };

//   final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
//     BottomNavigationBarItem(
//       icon: const Icon(Icons.home),
//       label: AppRoutes.homeScreenRouteValue.name,
//     ),
//     BottomNavigationBarItem(
//       icon: const Icon(Icons.sports_soccer),
//       label: AppRoutes.matchesScreenRouteValue.name,
//     ),
//     BottomNavigationBarItem(
//       icon: const Icon(Icons.directions_run),
//       label: AppRoutes.playersScreenRouteValue.name,
//     ),
//     BottomNavigationBarItem(
//       icon: const Icon(Icons.person),
//       label: AppRoutes.preferencesScreenRouteValue.name,
//     ),
//   ];

//   // int _generateBarIndexFromLocation(BuildContext context) {
//   //   // final GoRouter router = GoRouter.of(context);
//   //   // final String location = router.routerDelegate.currentConfiguration.fullPath;

//   //   final homePath = AppRoutes.homeScreenRouteValue.path;
//   //   final matchesPath = AppRoutes.matchesScreenRouteValue.path;
//   //   final playersPath = AppRoutes.playersScreenRouteValue.path;
//   //   final preferencesPath = AppRoutes.preferencesScreenRouteValue.path;

//   //   if (location == homePath) return 0;
//   //   if (location == matchesPath) return 1;
//   //   if (location == playersPath) return 2;
//   //   if (location == preferencesPath) return 3;

//   //   return 0;
//   // }
// }
