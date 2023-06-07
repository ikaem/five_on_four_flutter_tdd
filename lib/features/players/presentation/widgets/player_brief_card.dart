import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/icon_with_text.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:flutter/material.dart';

typedef OnTapPlayer = void Function(
  PlayerModel player,
);

// TODO might be possibly to unify with match participant ocard too
class PlayerBriefCard extends StatelessWidget {
  const PlayerBriefCard({
    super.key,
    required this.player,
    required this.onTapPlayer,
    required this.tappableIcon,
  });

  final PlayerModel player;
  final OnTapPlayer onTapPlayer;
  final Icon tappableIcon;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(
        SpacingConstants.medium,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
        color: ColorConstants.yellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                player.nickname,
                style: textTheme.titleLarge!.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                  fontSize: FontSizeConstants.mediumLarge,
                ),
              ),
              SizedBox(
                width: SpacingConstants.medium,
              ),
              GestureDetector(
                onTap: () {
                  onTapPlayer(
                    player,
                  );
                },
                child: tappableIcon,
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
