import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/app_bar_more_actions.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/home_screen/home_screen_view_content.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// TODO this needs a view, too
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _initializeScreen();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<InitialDataValue?> initialData =
        ref.watch(initialDataAppControllerProvider);

    final PlayerPreferencesController playerPreferencesController = ref.read(
      playerPreferencesAppControllerProvider.notifier,
    );

    final AsyncValue<InitialDataValue?> initialDataValue = initialData;

    return Scaffold(
      key: const Key(KeysConstants.homeScreenScaffoldKey),

      // FUTURE create CustomAppBar and call it FiveOn4AppBar
      appBar: AppBar(
        title: Text(
            "${playerPreferencesController.currentPlayerNickname}'s Matches"),
        actions: [
          AppBarMoreActions(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.sports_soccer,
        ),
        onPressed: () {
          context.pushNamed(
            AppRoutes.matchCreateScreenRouteValue.name,
          );
        },
      ),
      body: initialDataValue.when(
        error: (error, stackTrace) {
          return Center(
            child: Text("There was an error fetching initial data"),
          );
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
        data: (data) => HomeScreenViewContent(
          initialData: data!,
        ),
      ),
    );
  }

  Future<void> _initializeScreen() async {
    final InitialDataAppController initialDataAppController =
        ref.read(initialDataAppControllerProvider.notifier);

    await initialDataAppController.onLoadInitialData();
  }
}
