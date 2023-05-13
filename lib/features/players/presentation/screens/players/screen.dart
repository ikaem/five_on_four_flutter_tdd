import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_filters_container.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/players/domain/models/player/model.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/state/controllers/players_search/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/players_search/search_results_players.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PlayersScreen extends ConsumerWidget {
  PlayersScreen({super.key});

  late final PlayersSearchAppControllerProvider searchControllerProvider =
      playersSearchAppControllerProvider(PlayersSearchOptions(
    shouldSearchCurrentUser: true,
  ));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;
    // TODO in future, separate into view too

    final AsyncValue<List<PlayerModel>> playersSearchValue =
        ref.watch(searchControllerProvider);

    return Scaffold(
      key: const Key(KeysConstants.playersScreenScaffoldKey),
      appBar: AppBar(
        title: Text("Players"),
      ),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                ref
                    .read(searchControllerProvider.notifier)
                    .onChangeSearchTerm(value);
              },
              decoration: InputDecoration(
                labelText: "Search players",
                labelStyle: TextStyle(color: ColorConstants.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorConstants.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SpacingConstants.small,
            ),
            SearchFiltersContainer(themeText: themeText),
            SizedBox(
              height: SpacingConstants.mediumLarge,
            ),
            playersSearchValue.when(
              loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (error, stackTrace) {
                return Center(
                  child: Text("There was an issue searching players"),
                );
              },
              data: (data) {
                return Expanded(
                  child: SearchResultsPlayers(
                    players: data,
                    onTapPlayerResult: _onTapPlayerResult,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onTapPlayerResult({
    required BuildContext context,
    required PlayerModel playerModel,
  }) {
    context.pushNamed(
      AppRoutes.playerInfoScreenRouteValue.name,
      pathParameters: {
        AppConstants.idKey: playerModel.id,
      },
    );
  }
}
