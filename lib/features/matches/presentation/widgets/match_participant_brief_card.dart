import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';

class MatchParticipantBriefCard extends StatelessWidget {
  const MatchParticipantBriefCard({
    super.key,
    required this.matchParticipant,
  });

// TODO not sure if i should have a brief model here
  final MatchParticipantModel matchParticipant;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    return Container(
      padding: EdgeInsets.all(
        SpacingConstants.medium,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          DimensionsConstants.d10,
        ),
        color: ColorConstants.red,
      ),
      child: Row(
        children: [
          Text(
            matchParticipant.nickname,
            style: themeText.bodySmall,
          ),
          SizedBox(
            width: SpacingConstants.medium,
          ),
          GestureDetector(
            child: Icon(
              Icons.info,
            ),
          ),
        ],
      ),
    );
  }
}
