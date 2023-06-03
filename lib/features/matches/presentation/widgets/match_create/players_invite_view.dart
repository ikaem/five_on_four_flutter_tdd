import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_participantion/value.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_inputs.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/player_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchInviteParticipantsView extends ConsumerWidget {
  MatchInviteParticipantsView({
    super.key,
    required this.participantsInvitationsStream,
    required this.onTapRemoveInvitation,
    required this.onTapAddInvitation,
  });

  final Stream<List<MatchParticipationValue>> participantsInvitationsStream;
  final OnTapParticipation onTapRemoveInvitation;
  final OnTapParticipation onTapAddInvitation;

  late final PlayersSearchAppControllerProvider searchControllerProvider =
      playersSearchAppControllerProvider(PlayersSearchOptions(
    shouldSearchCurrentUser: false,
  ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final AsyncValue<List<PlayerModel>> playersSearchValue =
        ref.watch(searchControllerProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: SpacingConstants.medium),
          child: TextField(
            onChanged: (value) {
              ref
                  .read(searchControllerProvider.notifier)
                  .onChangeSearchTerm(value);
            },
            decoration: InputDecoration(
              labelText: "Search players",
              labelStyle: TextStyle(color: ColorConstants.black),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstants.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  "Selected players",
                  style: themeText.titleSmall,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: SpacingConstants.medium,
                ),
              ),
              StreamBuilder<List<MatchParticipationValue>>(
                  stream: participantsInvitationsStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );

                    final List<MatchParticipationValue>? data = snapshot.data;
                    if (data == null)
                      return SliverToBoxAdapter(child: SizedBox.shrink());

                    return SliverGrid.builder(
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 32,
                        maxCrossAxisExtent: 150,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final MatchParticipationValue invitation = data[index];

                        return Container(
                          width: 80,
                          padding: EdgeInsets.symmetric(
                            horizontal: SpacingConstants.medium,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstants.yellow,
                            borderRadius: BorderRadius.circular(
                              DimensionsConstants.d20,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  invitation.nickname,
                                  overflow: TextOverflow.ellipsis,
                                  style: themeText.labelMedium!.copyWith(
                                    color: ColorConstants.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => onTapRemoveInvitation(invitation),
                                child: Icon(
                                  Icons.cancel,
                                  color: ColorConstants.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: SpacingConstants.medium,
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "Search results",
                  style: themeText.titleSmall,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: SpacingConstants.medium,
                ),
              ),
              playersSearchValue.when(
                loading: () => SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, stackTrace) => SliverToBoxAdapter(
                  child: Center(
                    child: Text("There was an error retrieving results"),
                  ),
                ),
                data: (players) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final PlayerModel player = players[index];

                        return PlayerBriefCard(
                          player: player,
                          tappableIcon: Icon(
                            Icons.add_circle,
                            color: ColorConstants.white,
                          ),
                          onTapPlayer: (player) {
                            final MatchParticipationValue participationValue =
                                MatchParticipationValue(
                              playerId: player.id,
                              nickname: player.nickname,
                              status: MatchParticipantStatus.invited,
                            );
                            onTapAddInvitation(participationValue);
                          },
                        );
                      },
                      childCount: players.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
