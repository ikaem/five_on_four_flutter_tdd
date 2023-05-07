import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_title_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_venue_overview.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';

class MatchInfoScreenViewContent extends StatefulWidget {
  const MatchInfoScreenViewContent({
    super.key,
    required this.matchInfo,
  });

  final MatchInfoModel? matchInfo;

  @override
  State<MatchInfoScreenViewContent> createState() =>
      _MatchInfoScreenViewContentState();
}

class _MatchInfoScreenViewContentState
    extends State<MatchInfoScreenViewContent> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final MatchInfoModel? currentMatchInfo = widget.matchInfo;

    if (currentMatchInfo == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Padding(
      padding: EdgeInsets.all(SpacingConstants.small),
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: "Match info",
                ),
                Tab(
                  text: "Joined participants",
                ),
                Tab(
                  text: "Invited participants",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      MatchInfoTitleOverview(
                          title: currentMatchInfo.match.name),
                      SizedBox(
                        height: SpacingConstants.small,
                      ),
                      MatchInfoVenueOverview(),
                    ],
                  ),
                  // Text("Second tab")
                  ListView.builder(
                    key: ValueKey("Joined"),
                    itemCount: joinedParticipants.length,
                    itemBuilder: (context, index) =>
                        Text(joinedParticipants[index]),
                  ),
                  ListView.builder(
                    key: ValueKey("Invited"),
                    itemCount: invitedParticipants.length,
                    itemBuilder: (context, index) =>
                        Text(invitedParticipants[index]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// TODO remove hardcoded values in future
final List<String> joinedParticipants =
    List.generate(250, (index) => "Participant n: ${index + 1}");

final List<String> invitedParticipants =
    List.generate(5, (index) => "Participant n: ${index + 1}");
