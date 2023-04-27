import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/home_screen_initial_data_content.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// class HomeScreen extends ConsumerWidget {
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  // Widget build(BuildContext context, WidgetRef ref) {
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(initialDataAppControllerProvider.notifier)..onLoadInitialData();

    final AsyncValue<InitialDataValue?> initialData =
        ref.watch(initialDataAppControllerProvider);

    final InitialDataValue initialDataValue = initialData.value!;
    // final initialDataValue = controller.state.value!;

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
        onPressed: () {
          // TODO this renders this widget again - calls build method on each click
          context.pushNamed(
            AppRoutes.matchCreateScreenRouteValue.name,
          );
          // context.goNamed(
          //   AppRoutes.matchCreateScreenRouteValue.name,
          // );
          // TODO this does not render this widget again - it does not call build method on each click
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => MatchCreateScreen(),
          // ));
        },
      ),
      // TODO make a view out of this
      body: HomeScreenInitialDataContent(
        initialData: initialDataValue,
      ),
    );
  }
}


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }


  Future<void>
}