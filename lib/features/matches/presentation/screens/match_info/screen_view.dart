import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_join/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchInfoScreenView extends ConsumerWidget {
  MatchInfoScreenView({
    super.key,
    required this.matchInfo,
  });

  final MatchInfoModel matchInfo;

  late final MatchJoinAppControllerProvider test =
      matchJoinAppControllerProvider(match: matchInfo.match);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(test);
    final controller = ref.read(test.notifier);

    return Scaffold(
      body: Center(child: Text("What")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onJoinMatch(matchInfo.match.id);
        },
        child: value.when(
          data: (_) {
            return Text("Data");
          },
          error: (e, s) {
            return Text("Error");
          },
          loading: () {
            return Text("Loading...");
          },
        ),
      ),
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
