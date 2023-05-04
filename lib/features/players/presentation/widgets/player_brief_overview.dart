import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:flutter/material.dart';

// TODO this could potnetially be reused as well
class PlayerBriefOverview extends StatelessWidget {
  const PlayerBriefOverview({super.key});

  @override
  Widget build(BuildContext context) {
// TODO themes will beed to be adjustetd here
    final TextTheme textTheme = Theme.of(context).textTheme;
    // final ColorScheme colorsTheme = Theme.of(context).colorScheme;

    // TODO leave this widget, will need some stuff for navigation or so

    return ScreenMainTitle(
      primaryLeadingLabel: 'Welcome, ',
      primaryTrailingLabel: 'Karlo',
      secondaryLeadingLabel: 'of team ',
      secondaryTrailingLabel: 'Yolo',
    );
  }
}
