import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_info/screen_view.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_info_get/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchInfoScreen extends ConsumerWidget {
  MatchInfoScreen({
    super.key,
    required this.matchId,
  });

  final String matchId;

// TODO make some pattern for naming providers defined here
  late final MatchInfoGetAppControllerProvider controllerProvider =
      matchInfoGetAppControllerProvider(
    matchId,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(controllerProvider.notifier);
    final value = ref.watch(controllerProvider);

    return value.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        return Center(
          child: Text("There was an error retrieving the match"),
        );
      },
      data: (data) {
        if (data == null) return SizedBox.shrink();

        return MatchInfoScreenView(
          matchInfo: data,
          onReloadMatch: controller.onReloadMatch,
        );
      },
    );
  }
}
