import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/auth_status_new/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final value = ref.read(authStatusNewAppControllerProvider);

    value.addListener(() {
      final newValue = value;

      if (newValue.isAuthenticated) {
        context.go(AppRoutes.homeScreenPath);
      }

      // TODO test
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO test only to keep it here temporarily - this should probably not be here
    // ref.listen<AuthStatusNewAppController>(authStatusNewAppControllerProvider,
    //     (previous, next) {
    //   final bool isLoading = next.isLoading;

    //   // TODO test
    // });

    return Scaffold(
      key: const Key(WidgetKeysConstants.splashScreenScaffoldKey),
      body: Column(
        children: [
          CircularProgressIndicator(),
          // TODO make animation out of this, and have it count every some milliseconds
          Text("Five on 1.."),
          Text("Five on 2.."),
        ],
      ),
    );
  }
}
