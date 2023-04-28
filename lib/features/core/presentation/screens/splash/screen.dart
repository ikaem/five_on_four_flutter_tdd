import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(WidgetKeysConstants.splashScreenScaffoldKey),
      body: Column(
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
