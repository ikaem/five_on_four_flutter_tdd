import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/home_screen_initial_data_content.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final controller = ref.read(initialDataAppControllerProvider.notifier);

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
      // TODO make a view out of this
      body: HomeScreenInitialDataContent(
        initialData: initialDataValue,
      ),
    );
  }
}
