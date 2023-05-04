import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_inputs.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:flutter/material.dart';

class PlayerBriefCard extends StatelessWidget {
  const PlayerBriefCard({
    super.key,
    required this.player,
    // required this.themeText,
    required this.onTapPlayer,
    required this.tappableIcon,
  });

  final PlayerModel player;
  // final TextTheme themeText;
  // TODO move this defintion of typedef here instead
  final OnTapPlayer onTapPlayer;
  final Icon tappableIcon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(
        SpacingConstants.small,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.red,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.nickname,
                style: themeText.labelLarge!.copyWith(
                  color: ColorConstants.white,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSizeConstants.mediumLarge,
                ),
              ),
              SizedBox(
                height: SpacingConstants.xSmall,
              ),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: "Team: ",
                  ),
                  TextSpan(
                      text: "Some team name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))
                ],
                style: themeText.labelLarge!.copyWith(
                  color: ColorConstants.greyLight,
                  // fontWeight: FontWeight.bold,
                ),
              )
                  // player.nickname,
                  // style: themeText.labelLarge!.copyWith(
                  //   color: ColorConstants.white,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  ),
            ],
          ),
          SizedBox(
            width: SpacingConstants.medium,
          ),
          GestureDetector(
            onTap: () {
              onTapPlayer(
                // MatchParticipationValue.fromPlayerModel(player),
                player,
              );
            },
            child: tappableIcon,
          ),
        ],
      ),
    );
  }
}
