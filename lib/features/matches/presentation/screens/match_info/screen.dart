// TODO later make actual view for this

import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
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
    final AsyncValue<MatchInfoModel?> matchInfoValue =
        ref.watch(matchInfoGetAppControllerProvider(
      matchId,
    ));

    return Scaffold(
      key: Key(WidgetKeysConstants.matchInfoScreenScaffoldKey),
      appBar: AppBar(),
      body: matchInfoValue.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text("There was an error retrieving the match"),
        ),
        data: (matchInfo) {
          if (matchInfo == null)
            return Center(
              child: Text("There was an error retrieving the match"),
            );

          return Center(child: Text(matchInfo.match.name));
        },
      ),
    );
  }
}
