import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/app_bar_more_actions.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO preferences could potentially come from the bottom bar as well, not from the app bar
class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

// TODO eventually setup of view of the screen
// TODO this will need to get the preferences controller
  @override
  Widget build(BuildContext context, WidgetRef ref) {
// TOOD test
    final PlayerPreferencesController _playerPreferencesController = ref.read(
      playerPreferencesAppControllerProvider.notifier,
    );

// TODO test - i need to find something to listen on
    ref.watch(playerPreferencesAppControllerProvider);

    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Let's set you up"),
        actions: [
          AppBarMoreActions(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: ListView(
          children: [
            // TODO eventually, wrap this in its own widget too? or not needed?
            ScreenMainTitle(
              primaryLeadingLabel: "",
              primaryTrailingLabel: "Karlo",
              secondaryLeadingLabel: "Of which team?",
              secondaryTrailingLabel: "",
            ),
            SizedBox(
              height: SpacingConstants.xxLarge,
            ),
            Container(
              padding: EdgeInsets.all(SpacingConstants.small),
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.circular(
                  DimensionsConstants.d10,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO maybe good to separate these sections into their own widgets
                  _PreferencesAvatarSection(),
                  SizedBox(
                    height: SpacingConstants.large,
                  ),
                  _PreferencesTeamSection(),
                  SizedBox(
                    height: SpacingConstants.large,
                  ),
                  _PreferencesRegionAreaSection(
                    regionSizeStream:
                        _playerPreferencesController.regionSizeStream,
                    onRegionSizeChanged:
                        _playerPreferencesController.onChangeRegionSize,
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

class _PreferencesRegionAreaSection extends StatelessWidget {
  const _PreferencesRegionAreaSection({
    required Stream<int> regionSizeStream,
    required ValueSetter<int> onRegionSizeChanged,
  })  : _regionSizeStream = regionSizeStream,
        _onRegionSizeChanged = onRegionSizeChanged;

  final Stream<int> _regionSizeStream;
  final ValueSetter<int> _onRegionSizeChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Your active region size",
          style: textTheme.titleLarge,
        ),
        SizedBox(
          height: SpacingConstants.small,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Your current location: ",
              ),
              TextSpan(
                text: "Pula, Croatia",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: textTheme.bodySmall!.copyWith(
            color: ColorConstants.grey4,
          ),
        ),
        SizedBox(
          height: SpacingConstants.medium,
        ),
        StreamBuilder<int>(
          stream: _regionSizeStream,
          builder: (context, snapshot) {
            // TODO this stream builxer should probably wrap the label too
            // TODO make this abstract too
            // if (snapshot.connectionState == ConnectionState.waiting)
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );

            final int? regionSize = snapshot.data;
            if (regionSize == null) return SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Region size: ",
                      ),
                      TextSpan(
                        text: "$regionSize km",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorConstants.black,
                  ),
                ),
                SizedBox(
                  height: SpacingConstants.small,
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: SpacingConstants.medium),
                    decoration: BoxDecoration(
                      color: ColorConstants.red,
                      borderRadius: BorderRadius.circular(
                        SpacingConstants.small,
                      ),
                    ),
                    child: Slider(
                      min: 0,
                      max: 100,
                      value: regionSize.toDouble(),
                      // TODO make this later have double by default
                      onChanged: (double value) => _onRegionSizeChanged(
                        value.toInt(),
                      ),
                      activeColor: ColorConstants.yellow,
                      inactiveColor: ColorConstants.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: SpacingConstants.medium,
        ),
        // ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //     backgroundColor: ColorConstants.red,
        //     foregroundColor: ColorConstants.white,
        //   ),
        //   onPressed: () {},
        //   child: Text("Submit"),
        // ),
      ],
    );
  }
}

class _PreferencesTeamSection extends StatelessWidget {
  const _PreferencesTeamSection();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Your team",
          style: textTheme.titleLarge,
        ),
        SizedBox(
          height: SpacingConstants.small,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Your current team: ",
              ),
              TextSpan(
                text: "Some team name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          style: textTheme.bodySmall!.copyWith(
            color: ColorConstants.grey4,
          ),
        ),
        SizedBox(
          height: SpacingConstants.small,
        ),
        SizedBox(
          height: DimensionsConstants.d60,
          child: TextField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(),
              hintText: "Type new team name",
            ),
          ),
        ),
        SizedBox(
          height: SpacingConstants.small,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: ColorConstants.red,
            foregroundColor: ColorConstants.white,
          ),
          onPressed: () {},
          child: Text("Ask to join"),
        ),
      ],
    );
  }
}

class _PreferencesAvatarSection extends StatelessWidget {
  const _PreferencesAvatarSection();
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your avatar",
          style: textTheme.titleLarge,
        ),
        SizedBox(
          height: SpacingConstants.small,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: DimensionsConstants.d108,
              width: DimensionsConstants.d108,
              color: ColorConstants.grey3,
            ),
            SizedBox(
              width: SpacingConstants.small,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   color: Colors.amber,
                  //   width: double.infinity,
                  //   height: 40,
                  // )
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Find image"),
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  SizedBox(
                    height: SpacingConstants.xSmall,
                  ),
                  Text(
                    "some-file-name.jpg",
                    style: textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SpacingConstants.medium,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Find image"),
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: ColorConstants.red,
                      foregroundColor: ColorConstants.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
