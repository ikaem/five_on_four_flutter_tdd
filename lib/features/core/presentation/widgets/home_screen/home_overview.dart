import 'package:five_on_four_flutter_tdd/features/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info/match_info_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/player_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeOverview extends StatelessWidget {
  const HomeOverview({
    super.key,
    required this.initialData,
  });

  final InitialDataValue initialData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PlayerBriefOverview(),
        SizedBox(
          height: SpacingConstants.xLarge,
        ),
        MatchInfoBriefOverview(
          matchInfo: initialData.nextMatch,
          noMatchInfoLabel: "No upcoming matches",
        ),
      ],
    );
  }
}
