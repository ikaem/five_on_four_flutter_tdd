import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class HomeScreen extends ConsumerWidget {
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  // Widget build(BuildContext context, WidgetRef ref) {
  Widget build(BuildContext context) {
    // final controller = ref.read(initialDataAppControllerProvider.notifier);

    // final AsyncValue<InitialDataValue?> initialData =
    //     ref.watch(initialDataAppControllerProvider);

    // final InitialDataValue initialDataValue = initialData.value!;
    // // final initialDataValue = controller.state.value!;

    return Scaffold(
      key: const Key(WidgetKeysConstants.homeScreenScaffoldKey),

      // TODO create CustomAppBar and call it FiveOn4AppBar
      appBar: AppBar(
        title: Text("Karlo's Matches"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.sports_soccer,
        ),
        onPressed: () => context.pushNamed(
          AppRoutes.matchCreateScreenRouteValue.name,
        ),
      ),
      // TODO make a view out of this
      // body: HomeScreenInitialDataContent(
      //   initialData: initialDataValue,
      // ),
    );
  }
}
