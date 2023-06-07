import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerBriefOverview extends ConsumerWidget {
  const PlayerBriefOverview({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO this can access its own thing too
    // TODO leave this widget, will need some stuff for navigation or so

    final PlayerPreferencesController playerPreferencesController = ref.read(
      playerPreferencesAppControllerProvider.notifier,
    );

    return ScreenMainTitle(
      primaryLeadingLabel: 'Welcome, ',
      primaryTrailingLabel: playerPreferencesController.currentPlayerNickname,
      secondaryLeadingLabel: 'of team ',
      secondaryTrailingLabel: 'Yolo',
    );
  }
}
