import 'dart:developer';

import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  // late final InitialDataController _initialDataController =
  //     ref.read(initialDataControllerProvider);

  @override
  void initState() {
    super.initState();
    _initializeScreen();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<InitialDataValue?>>(initialDataAppControllerProvider,
        (previous, next) {
      next.when(
        data: (data) {
          // TODO navigate here
          log("Logging when should navigating to home screen");
          context.go(AppRoutes.homeScreenPath);
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      );
    });

    // return Container(
    //   key: Key(AuthKeysConstants.mainScreenScaffoldKey),
    // );
    final AsyncValue<InitialDataValue?> initialDataState =
        ref.watch(initialDataAppControllerProvider);

    // if (initialDataState.isLoading) {
    //   return Scaffold(
    //     key: Key(AuthKeysConstants.mainScreenScaffoldKey),
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }

    return Scaffold(
      key: Key(WidgetKeysConstants.mainScreenScaffoldKey),
      body: initialDataState.when(
        // data: (data) => SizedBox.shrink(),
        // data: (data) => Center(
        //   child: Text("Some data has loaded"),
        // ),
        data: (data) => SizedBox.shrink(),
        error: (error, stackTrace) {
          print("Here i am logging!!!!!!!!!!!!!!: $error");
          return Center(
            child: Text("There was an error fetching initial data"),
          );
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<void> _initializeScreen() async {
    // REF.listen can only be used in build method
// /*     ref.listen<AsyncValue<InitialDataValue?>>(initialDataAppControllerProvider,
//         (previous, next) {
//       next.when(
//         data: (data) {
//           // TODO navigate here
//           log("Logging when should navigating to home screen");
//           context.go(AppRoutes.homeScreenPath);
//         },
//         error: (error, stackTrace) => null,
//         loading: () => null,
//       );
//     }); */

    final InitialDataAppController initialDataAppController =
        ref.read(initialDataAppControllerProvider.notifier);

    await initialDataAppController.onLoadInitialData();
  }
}
