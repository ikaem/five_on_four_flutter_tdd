import 'package:five_on_four_flutter_tdd/features/core/utils/helpers/dialog_opener.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participant_invitation/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/participant_invitation_card.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_view.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

// TODO test - typedefs can go here, sure
typedef OnTapParticipantInvitation = void Function(
  MatchParticipantInvitationValue invitation,
);

// TODO potentially, this should be called fifferently
class MatchCreatePlayersInviteInputs extends StatelessWidget {
  const MatchCreatePlayersInviteInputs({
    super.key,
    required this.sectionLabelStyle,
    required this.participantsInvitationsStream,
    required this.onAddParticipantInvitation,
    required this.onRemoveParticipantInvitation,
    // required this.searchedPlayersValue,
  });

  final TextStyle sectionLabelStyle;

  final Stream<List<MatchParticipantInvitationValue>>
      participantsInvitationsStream;

  final OnTapParticipantInvitation onAddParticipantInvitation;
  final OnTapParticipantInvitation onRemoveParticipantInvitation;
  // final AsyncValue<List<PlayerModel>> searchedPlayersValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.medium),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Invited players",
                style: sectionLabelStyle,
              ),
              IconButton(
                // TODO this wont work - becuase async value will not be updated - will need to access provider in the view itself
                onPressed: _onOpenInvitationDialog(
                  context: context,
                  participantsInvitationsStream: participantsInvitationsStream,
                  // searchedPlayersValue: searchedPlayersValue,
                ),
                icon: Icon(
                  Icons.add_circle,
                  color: ColorConstants.red,
                ),
              ),
            ],
          ),
          StreamBuilder<List<MatchParticipantInvitationValue>>(
              stream: participantsInvitationsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                final List<MatchParticipantInvitationValue>? data =
                    snapshot.data;
                if (data == null) return SizedBox.shrink();

                return ListView.separated(
                  // TODO not sure if this shrink wrap is needed - try to remove it
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: SpacingConstants.medium,
                  ),
                  itemBuilder: (context, index) {
                    final MatchParticipantInvitationValue invitation =
                        data[index];

                    return MatchParticipantInvitationCard(
                      // TODO using key because there might be removal of invitations
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

  // TODO this will be calling a dialog functions defined elsewhere
  Future<void> Function() _onOpenInvitationDialog({
    required BuildContext context,
    required Stream<List<MatchParticipantInvitationValue>>
        participantsInvitationsStream,
    // required AsyncValue<List<PlayerModel>> searchedPlayersValue,
  }) =>
      () async {
        await DialogOpener.contentDialog<void>(
          context: context,
          content: MatchInviteParticipantsView(
            // searchedPlayersValue: searchedPlayersValue,
            participantsInvitationsStream: participantsInvitationsStream,
            onTapRemoveInvitation: onRemoveParticipantInvitation,
            onTapAddInvitation: onAddParticipantInvitation,
          ),
          title: "Invite match participants",
        );

        // await showDialog<void>(
        //   context: context,
        //   builder: (context) {
        //     final ThemeData theme = Theme.of(context);
        //     final TextTheme themeText = theme.textTheme;

        //     return Dialog(
        //       child: Padding(
        //         padding: const EdgeInsets.all(SpacingConstants.medium),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
        //             Row(
        //               children: [
        //                 Expanded(
        //                   child: Center(
        //                     child: Text(
        //                       "This is title",
        //                       style: themeText.titleMedium,
        //                     ),
        //                   ),
        //                 ),
        //                 GestureDetector(
        //                   onTap: () => Navigator.pop(context),
        //                   child: Icon(
        //                     Icons.cancel,
        //                     color: ColorConstants.black,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             Flexible(
        //               child: MatchInviteParticipantsView(),
        //               // child: Center(child: Text("Hello")),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
      };
}

// TODO MOVE to its own widget for now
