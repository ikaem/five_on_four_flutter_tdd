import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/dialog_opener.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/participant_invitation_card.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_view.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

typedef OnTapParticipation = void Function(
  MatchParticipationValue participation,
);

class MatchCreatePlayersInviteInputs extends StatelessWidget {
  const MatchCreatePlayersInviteInputs({
    super.key,
    required this.sectionLabelStyle,
    required this.participantsInvitationsStream,
    required this.onAddParticipantInvitation,
    required this.onRemoveParticipantInvitation,
  });

  final TextStyle sectionLabelStyle;

  final Stream<List<MatchParticipationValue>> participantsInvitationsStream;

  final OnTapParticipation onAddParticipantInvitation;
  final OnTapParticipation onRemoveParticipantInvitation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SpacingConstants.mediumLarge),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Invited players",
                style: sectionLabelStyle,
              ),
              SizedBox(
                width: SpacingConstants.small,
              ),
              GestureDetector(
                onTap: _onOpenInvitationDialog(
                  context: context,
                  participantsInvitationsStream: participantsInvitationsStream,
                ),
                child: Icon(
                  Icons.add_circle,
                  color: ColorConstants.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SpacingConstants.small,
          ),
          Divider(
            color: ColorConstants.grey4,
          ),
          StreamBuilder<List<MatchParticipationValue>>(
              stream: participantsInvitationsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                final List<MatchParticipationValue>? data = snapshot.data;
                if (data == null) return SizedBox.shrink();

                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: SpacingConstants.medium,
                  ),
                  itemBuilder: (context, index) {
                    final MatchParticipationValue invitation = data[index];

                    return MatchParticipantInvitationCard(
                      key: ValueKey(invitation.playerId),
                      invitation: invitation,
                      onTapInfo: (playerId) {},
                      onTapRemove: onRemoveParticipantInvitation,
                    );
                  },
                );
              }),
        ],
      ),
    );
  }

  Future<void> Function() _onOpenInvitationDialog({
    required BuildContext context,
    required Stream<List<MatchParticipationValue>>
        participantsInvitationsStream,
  }) =>
      () async {
        await DialogOpener.contentDialog<void>(
          context: context,
          content: MatchInviteParticipantsView(
            participantsInvitationsStream: participantsInvitationsStream,
            onTapRemoveInvitation: onRemoveParticipantInvitation,
            onTapAddInvitation: onAddParticipantInvitation,
          ),
          title: "Invite match participants",
        );
      };
}
