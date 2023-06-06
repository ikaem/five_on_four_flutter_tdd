import 'package:five_on_four_flutter_tdd/features/core/utils/constants/assets_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const Key(KeysConstants.splashScreenScaffoldKey),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: DimensionsConstants.d10,
              ),
              SvgPicture.asset(
                AssetsConstants.pathLogoInline,
              ),
            ],
          ),
        ));
  }
}
