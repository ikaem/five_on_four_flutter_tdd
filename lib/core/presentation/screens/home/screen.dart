import 'package:five_on_four_flutter_tdd/core/domain/values/initial_data/value.dart';
import 'package:five_on_four_flutter_tdd/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';
import 'package:five_on_four_flutter_tdd/core/presentation/widgets/home_screen_initial_data_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<InitialDataValue?> initialData =
        ref.watch(initialDataAppControllerProvider);

// TODO this counts on home screen being redirected to from main screen
    final InitialDataValue initialDataValue = initialData.value!;

    return Scaffold(
        // TODO create CustomAppBar and call it FiveOn4AppBar
        appBar: AppBar(
          title: Text("Karlo's Matches"),
        ),
        body: HomeScreenInitialDataContent(
          initialData: initialDataValue,
        )
        // body: Padding(
        //   padding: EdgeInsets.all(SpacingConstants.small),
        //   child: Column(
        //     // TODO maybe later this should be a list view
        //     children: [
        //       PlayerBriefOverview(),
        //       SizedBox(
        //         height: SpacingConstants.xxLarge,
        //       ),
        //       MatchInfoBriefOverview(matchInfo: initialDataValue.nextMatch),
        //       SizedBox(
        //         height: SpacingConstants.xxLarge,
        //       ),
        //       Flexible(
        //         child: MatchesBriefsListsOverview(
        //           matchesOfSomeType: initialDataValue.joinedMatches,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
