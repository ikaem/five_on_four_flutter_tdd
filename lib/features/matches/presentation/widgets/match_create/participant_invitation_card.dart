import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participant_invitation/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_inputs.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';

class MatchParticipantInvitationCard extends StatelessWidget {
  const MatchParticipantInvitationCard({
    super.key,
    required this.invitation,
    required this.onTapInfo,
    required this.onTapRemove,
  });

// TODO not sure if i should have a brief model here
  final MatchParticipantInvitationValue invitation;
  final ValueSetter<String> onTapInfo;
  final OnTapParticipantInvitation onTapRemove;

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
            invitation.nickname,
            style: themeText.bodySmall,
          ),
          SizedBox(
            width: SpacingConstants.medium,
          ),
          GestureDetector(
            onTap: () => onTapInfo(invitation.playerId),
            child: Icon(
              Icons.info,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => onTapRemove(invitation),
            child: Icon(
              Icons.cancel_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
