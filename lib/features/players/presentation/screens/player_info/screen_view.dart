import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_brief_card.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class PlayerInfoScreenView extends StatelessWidget {
  const PlayerInfoScreenView({
    super.key,
    required this.playerModel,
  });

  final PlayerModel playerModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    return Scaffold(
      key: Key(KeysConstants.matchInfoScreenScaffoldKey),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScreenMainTitle(
              primaryLeadingLabel: '',
              primaryTrailingLabel: playerModel.nickname,
              secondaryLeadingLabel: 'of team ',
              secondaryTrailingLabel: 'Yolo',
            ),
            SizedBox(height: SpacingConstants.large),
            Container(
              // TODO make a widget out of this container with color, and rounded space
              padding: EdgeInsets.all(SpacingConstants.small),
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(DimensionsConstants.d10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Matches history",
                    style: themeText.titleSmall,
                  ),
                  SizedBox(
                    height: SpacingConstants.medium,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                      height: SpacingConstants.small,
                    ),
                    itemBuilder: (context, index) {
                      final MatchModel randomMatch = MatchModel.fromRandom();

                      return MatchBriefCard(match: randomMatch);
                    },
                    itemCount: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
