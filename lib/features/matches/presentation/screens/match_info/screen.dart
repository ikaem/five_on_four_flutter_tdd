// TODO later make actual view for this

import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/match_info/screen_view.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_info_get/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchInfoScreen extends ConsumerWidget {
  const MatchInfoScreen({
    super.key,
    required this.matchId,
  });

  final String matchId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MatchInfoModel?> matchInfoState =
        ref.watch(matchInfoGetAppControllerProvider(
      matchId,
    ));

    return MatchInfoScreenView(
      matchInfoState: matchInfoState,
    );
  }
}
