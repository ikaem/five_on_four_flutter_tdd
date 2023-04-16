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
          // TODO not sure if this is needed
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
      // CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: Text("Joining players"),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding:
      //             EdgeInsets.only(bottom: SpacingConstants.small),
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) {
      //           final List<String> participantsList =
      //               joinedParticipants;
      //           final String participant = participantsList[index];

      //           return Text(participant);
      //         },
      //         childCount: joinedParticipants.length,
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Text("Invited players"),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding:
      //             EdgeInsets.only(bottom: SpacingConstants.small),
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) {
      //           final List<String> participantsList =
      //               invitedParticipants;
      //           final String participant = participantsList[index];

      //           return Text(participant);
      //         },
      //         childCount: invitedParticipants.length,
      //       ),
      //     ),
      //   ],
      // ),

      // child: Column(
      //   // TODO not sure exaclty what this does
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     MatchInfoTitleOverview(title: currentMatchInfo.match.name),
      //     SizedBox(
      //       height: SpacingConstants.small,
      //     ),
      //     MatchInfoVenueOverview(),
      //     //   Text("Hello"),
      //     //   Expanded(
      //     //     child: DefaultTabController(
      //     //       length: 2,
      //     //       child: Column(
      //     //         mainAxisSize: MainAxisSize.min,
      //     //         children: [
      //     //           TabBar(
      //     //             tabs: [
      //     //               Tab(
      //     //                 text: "First",
      //     //               ),
      //     //               Tab(
      //     //                 text: "Second",
      //     //               ),
      //     //             ],
      //     //           ),
      //     //           Expanded(
      //     //             child: TabBarView(
      //     //               children: [
      //     //                 ListView.builder(
      //     //                   itemCount: joinedParticipants.length,
      //     //                   itemBuilder: (context, index) =>
      //     //                       Text(joinedParticipants[index]),
      //     //                 ),
      //     //                 ListView.builder(
      //     //                   itemCount: invitedParticipants.length,
      //     //                   itemBuilder: (context, index) =>
      //     //                       Text(invitedParticipants[index]),
      //     //                 ),
      //     //               ],
      //     //             ),
      //     //           )
      //     //         ],
      //     //       ),
      //     //     ),
      //     //   )
      //   ],
      // ),

      // TODO this has issues with scroll vie in scroll view - there is liste view builder nested here
      // maybe just separate the two
      // TODO just not flexible enough this approach, and i have to make this stateful, and i dont like it
      // TODO this could potentially be its own widget, so we dont have to store
      // child: CustomScrollView(
      //   slivers: [
      //     SliverToBoxAdapter(
      //       child: Text("Hello"),
      //     ),
      //     SliverToBoxAdapter(
      //       child: DefaultTabController(
      //         initialIndex: currentTabIndex,
      //         length: 2,
      //         child: TabBar(
      //           onTap: (value) {
      //             currentTabIndex = value;
      //             setState(() {});
      //           },
      //           tabs: [
      //             Tab(text: "First"),
      //             Tab(text: "Second"),
      //           ],
      //         ),
      //       ),
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         (context, index) {
      //           final List<String> participantsList = currentTabIndex == 0
      //               ? joinedParticipants
      //               : invitedParticipants;
      //           final String participant = participantsList[index];

      //           return Text(participant);
      //         },
      //         childCount: currentTabIndex == 0
      //             ? joinedParticipants.length
      //             : invitedParticipants.length,
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

// TODO move to its own file

final List<String> joinedParticipants =
    List.generate(250, (index) => "Participant n: ${index + 1}");

final List<String> invitedParticipants =
    List.generate(5, (index) => "Participant n: ${index + 1}");
