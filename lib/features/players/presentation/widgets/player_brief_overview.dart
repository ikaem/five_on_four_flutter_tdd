import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:flutter/material.dart';

class PlayerBriefOverview extends StatelessWidget {
  const PlayerBriefOverview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO leave this widget, will need some stuff for navigation or so

    return ScreenMainTitle(
      primaryLeadingLabel: 'Welcome, ',
      primaryTrailingLabel: 'Karlo',
      secondaryLeadingLabel: 'of team ',
      secondaryTrailingLabel: 'Yolo',
    );
  }
}
