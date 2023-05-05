import 'package:five_on_four_flutter_tdd/features/players/presentation/screens/player_info/screen_view.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/player_info_get/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerInfoScreen extends ConsumerWidget {
  PlayerInfoScreen({
    super.key,
    required this.playerId,
  });

  final String playerId;

  // TODO not sure if this is ok
  late final PlayerInfoGetControllerProvider controllerProvider =
      playerInfoGetControllerProvider(
    playerId,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(controllerProvider);

    return value.when(
      error: (error, stackTrace) {
        return Center(
          child: Text("There was an error retrieving the player"),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      data: (data) {
        return PlayerInfoScreenView(playerModel: data);
      },
    );
  }
}
