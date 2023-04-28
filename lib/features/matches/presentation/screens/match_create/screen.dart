import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_create/screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchCreateScreen extends ConsumerWidget {
  const MatchCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final value = ref.watch(matchJoinAppControllerProvider);

    return MatchCreateScreenView();
  }
}
