import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_participant_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchCreateScreen extends ConsumerWidget {
  const MatchCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MatchCreateScreenView();
  }
}

// TODO move to its own file later
class MatchCreateScreenView extends StatelessWidget {
  const MatchCreateScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final TextStyle sectionLabelStyle = themeText.labelMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: ListView(
          children: [
            Text(
                "Some match info  that will be wrapped in a stream of match name value"),
            // TODO make this its own widget
            MatchCreateBasicInputs(
              sectionLabelStyle: sectionLabelStyle.copyWith(
                color: ColorConstants.yellow,
              ),
            ),
            SizedBox(
              height: SpacingConstants.small,
            ),
            // TODO his will also be wrapped in stream builder maybe, to rebuild?
            MatchCreatePlayersInviteInputs(
              sectionLabelStyle: sectionLabelStyle.copyWith(
                color: ColorConstants.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MatchCreatePlayersInviteInputs extends StatelessWidget {
  const MatchCreatePlayersInviteInputs({
    super.key,
    required this.sectionLabelStyle,
  });

  final TextStyle sectionLabelStyle;

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
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  color: ColorConstants.red,
                ),
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 15,
            separatorBuilder: (context, index) => SizedBox(
              height: SpacingConstants.medium,
            ),
            itemBuilder: (context, index) {
              // return Text("Try me");

              final MatchParticipantModel matchParticipant =
                  MatchParticipantModel(
                createdAt: DateTime.now().millisecondsSinceEpoch,
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                userId: DateTime.now().millisecondsSinceEpoch.toString(),
                nickname: "Participant $index",
                status: MatchParticipantStatus.invited,
                invitationExpirationTime: DateTime.now()
                    .add(Duration(days: 7))
                    .millisecondsSinceEpoch,
              );

              return MatchParticipantBriefCard(
                matchParticipant: matchParticipant,
              );
            },
          ),
        ],
      ),
    );
  }
}

// TODO move this elsewhere of make private
class MatchCreateBasicInputs extends StatelessWidget {
  const MatchCreateBasicInputs({
    super.key,
    required this.sectionLabelStyle,
  });

  final TextStyle sectionLabelStyle;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    // final TextStyle sectionLabelStyle = themeText.labelMedium!.copyWith(
    //   color: ColorConstants.yellow,
    //   fontWeight: FontWeight.bold,
    // );

    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO all of these need to be wrapped in their own streams for validation - will need to create some helpers for validat
          // TODO this could potentially be a custom widget
          TextField(
            decoration: InputDecoration(
              labelText: "Match name",
              // labelStyle: TextStyle(color: ColorConstants.white),
              // enabledBorder: UnderlineInputBorder(
              //   borderSide: BorderSide(
              //     color: ColorConstants.white,
              //     width: 2.0,
              //   ),
              // ),
            ),
          ),
          SizedBox(
            height: SpacingConstants.xxLarge,
          ),
          Text(
            "location",
            style: sectionLabelStyle,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Location name",
            ),
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Address",
            ),
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "City",
            ),
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Country",
            ),
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          SizedBox(
            height: SpacingConstants.large,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Text(
            "date & time",
            style: sectionLabelStyle,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Select date",
            ),
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Select time",
            ),
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          SizedBox(
            height: SpacingConstants.large,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Row(
            children: [
              Text(
                "Join the match",
                style: themeText.bodySmall!.copyWith(
                  color: ColorConstants.white,
                ),
              ),
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
