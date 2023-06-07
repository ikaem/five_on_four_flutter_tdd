import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info/match_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info/match_participants_list.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
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
              labelColor: ColorConstants.grey1,
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
            SizedBox(
              height: SpacingConstants.mediumLarge,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MatchOverview(currentMatchInfo: currentMatchInfo),
                  MatchParticipantsList(
                    participants: currentMatchInfo.match.joinedParticipants,
                  ),
                  MatchParticipantsList(
                    participants: currentMatchInfo.match.invitedParticipants,
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



// TODO move ot its owe file

