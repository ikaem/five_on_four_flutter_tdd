import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/icon_with_text.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:flutter/material.dart';

class MatchParticipantBriefCard extends StatelessWidget {
  const MatchParticipantBriefCard({
    super.key,
    required this.matchParticipant,
  });

  final MatchParticipantModel matchParticipant;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Container(
      padding: EdgeInsets.all(
        SpacingConstants.medium,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          DimensionsConstants.d10,
        ),
        color: ColorConstants.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                matchParticipant.nickname,
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.black,
                ),
              ),
              SizedBox(
                width: SpacingConstants.small,
              ),
              GestureDetector(
                child: Icon(
                  Icons.info,
                  color: ColorConstants.red,
                ),
                // FUTURE: implement onTap
              ),
            ],
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          IconWithText(
            icon: Icons.checkroom,
            iconColor: ColorConstants.grey5,
            iconSize: FontSizeConstants.medium,
            text: "Some team",
            textStyle: textTheme.titleSmall!.copyWith(
              color: ColorConstants.grey5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
