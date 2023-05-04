import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/player_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

typedef OnTapPlayerResult = void Function({
  required BuildContext context,
  required PlayerModel playerModel,
});

class SearchResultsPlayers extends StatelessWidget {
  const SearchResultsPlayers({
    super.key,
    required this.players,
    required this.onTapPlayerResult,
  });

  final List<PlayerModel> players;
  final OnTapPlayerResult onTapPlayerResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        SpacingConstants.small,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(
          DimensionsConstants.d10,
        ),
      ),
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
              color: ColorConstants.white,
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
    );
  }
}
