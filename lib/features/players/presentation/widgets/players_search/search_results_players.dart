import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/player_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

// FUTURE can all thes list widget s be united, so we just pass them item to be rendered?
typedef OnTapPlayerResult = void Function({
  required BuildContext context,
  required PlayerModel playerModel,
});

class PlayerBriefsList extends StatelessWidget {
  const PlayerBriefsList({
    super.key,
    required this.players,
    required this.onTapPlayerResult,
    this.title,
  });

  final List<PlayerModel> players;
  final OnTapPlayerResult onTapPlayerResult;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final Widget? listTitle = title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (listTitle != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: SpacingConstants.small,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                listTitle,
                Divider(
                  color: ColorConstants.grey3,
                ),
              ],
            ),
          ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: SpacingConstants.small,
              );
            },
            itemBuilder: (context, index) {
              final PlayerModel player = players[index];

              return PlayerBriefCard(
                player: player,
                tappableIcon: Icon(
                  Icons.info,
                  color: ColorConstants.red,
                ),
                onTapPlayer: (player) {
                  onTapPlayerResult(
                    context: context,
                    playerModel: player,
                  );
                },
              );
            },
            itemCount: players.length,
          ),
        ),
      ],
    );
  }
}
