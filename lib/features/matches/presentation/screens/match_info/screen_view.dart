import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_join/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_screen_view_content.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchInfoScreenView extends ConsumerWidget {
  MatchInfoScreenView({
    super.key,
    required this.matchInfo,
    required this.onReloadMatch,
    // TODO we can pass function here to refetch match - for instance, on successfully join or unjoin
  });

  final MatchInfoModel matchInfo;
  final VoidCallback onReloadMatch;

// TODO hopefully this is ok
  late final MatchJoinAppControllerProvider controllerProvider =
      matchJoinAppControllerProvider(
    match: matchInfo.match,
    onMatchJoinAction: onReloadMatch,
  );

// TODO lets see if same provider exists when we rebuild widget here
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MatchJoinAppController controller =
        ref.read(controllerProvider.notifier);
    final AsyncValue<void> value = ref.watch(controllerProvider);
    final bool hasPlayerJoinedMatch = controller.hasCurrentPlayerJoinedMatch;

    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

// TODO not good to do it here
    // ref.listen(controllerProvider, (prevState, nextState) {
    //   nextState.when(
    //     error: (e, st) => null,
    //     loading: () => null,
    //     data: (data) => onReloadMatch,
    //   );
    // });

    return Scaffold(
        key: Key(KeysConstants.matchInfoScreenScaffoldKey),
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                controller.onToggleMatchParticipation();
              },
              child: Text(
                hasPlayerJoinedMatch ? "UNJOIN" : "JOIN",
                style:
                    themeText.labelLarge!.copyWith(color: ColorConstants.black),
              ),
            )
          ],
        ),
        body: MatchInfoScreenViewContent(matchInfo: matchInfo)
        // floatingActionButton: FloatingActionButton(onPressed: () => ,),
        // body: matchInfoState.when(
        //   loading: () => Center(child: CircularProgressIndicator()),
        //   error: (error, stackTrace) {
        //     return Center(
        //       child: Text("There was an error retrieving the match"),
        //     );
        //   },
        //   data: (matchInfo) => MatchInfoScreenViewContent(matchInfo: matchInfo),
        // ),
        // )
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     // await controller.onJoinMatch(matchInfo.match.id);
        //     await controller.onToggleMatchParticipation();
        //   },
        //   child: value.when(
        //     data: (_) {
        //       return Text("Data");
        //     },
        //     error: (e, s) {
        //       return Text("Error");
        //     },
        //     loading: () {
        //       return Text("Loading...");
        //     },
        //   ),
        // ),
        );
    // final matchJoinController = matchJoinAppControllerProvider(match: matchInfo.match).notifier;
    // final matchJoinState = ref.read(
    //   // matchJoinAppControllerProvider(
    //   //   match: matchInfo.match,
    //   // ),
    //   matchCreateAppControllerProvider.
    // );

    // final AsyncValue<void> matchJoinState =
    //     ref.watch(matchJoinAppControllerProvider(
    //   match: matchInfo.match,
    // ));

    // matchJoinState.

    // final test = ref
    //     .watch(matchJoinAppControllerProvider(match: matchInfo.match).notifier);

    // final value = test.stateValue;

    // return Scaffold(
    //     key: Key(WidgetKeysConstants.matchInfoScreenScaffoldKey),
    //     appBar: AppBar(),
    //     body: MatchInfoScreenViewContent(matchInfo: matchInfo)
    //     // floatingActionButton: FloatingActionButton(onPressed: () => ,),
    //     // body: matchInfoState.when(
    //     //   loading: () => Center(child: CircularProgressIndicator()),
    //     //   error: (error, stackTrace) {
    //     //     return Center(
    //     //       child: Text("There was an error retrieving the match"),
    //     //     );
    //     //   },
    //     //   data: (matchInfo) => MatchInfoScreenViewContent(matchInfo: matchInfo),
    //     // ),
    //     );

    // TODO new
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }