import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/app_bar_more_actions.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

// TODO preferences could potentially come from the bottom bar as well, not from the app bar
class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});

// TODO eventually setup of view of the screen
// TODO this will need to get the preferences controller
  @override
  Widget build(BuildContext context) {
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
                  _PreferencesRegionAreaSection(),
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
  const _PreferencesRegionAreaSection();

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
            color: ColorConstants.greyDark,
          ),
        ),
        SizedBox(
          height: SpacingConstants.medium,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Region size: ",
              ),
              TextSpan(
                text: "60 km",
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
          child: Slider(
            min: 0,
            max: 100,
            value: 60.0,
            onChanged: (value) {},
            activeColor: ColorConstants.red,
            inactiveColor: ColorConstants.white,
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
          child: Text("Submit"),
        ),
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
            color: ColorConstants.greyDark,
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
              color: ColorConstants.grey,
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
