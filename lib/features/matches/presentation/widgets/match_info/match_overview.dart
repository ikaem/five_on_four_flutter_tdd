import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info/match_info_title_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info/match_info_venue_overview.dart';

import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class MatchOverview extends StatelessWidget {
  const MatchOverview({
    super.key,
    required this.currentMatchInfo,
  });

  final MatchInfoModel currentMatchInfo;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MatchInfoTitleOverview(
          title: currentMatchInfo.match.name,
        ),
        SizedBox(
          height: SpacingConstants.xLarge,
        ),
        MatchInfoVenueOverview(
          match: currentMatchInfo.match,
          weather: currentMatchInfo.weather,
        ),
      ],
    );
  }
}
