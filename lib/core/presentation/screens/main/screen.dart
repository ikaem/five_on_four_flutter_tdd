import 'dart:developer';

import 'package:five_on_four_flutter_tdd/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';

import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      key: Key(AuthKeysConstants.mainScreenScaffoldKey),
      body: initialDataState.when(
        // data: (data) => SizedBox.shrink(),
        data: (data) => Center(
          child: Text("Some data has loaded"),
        ),
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
    ref.listen<AsyncValue<InitialDataValue?>>(initialDataAppControllerProvider,
        (previous, next) {
      next.when(
        data: (data) {
          // TODO navigate here
          log("Logging when should navigating to home screen");
        },
        error: (error, stackTrace) => null,
        loading: () => null,
      );
    });

    final InitialDataAppController initialDataAppController =
        ref.read(initialDataAppControllerProvider.notifier);

    await initialDataAppController.onLoadInitialData();
  }
}
