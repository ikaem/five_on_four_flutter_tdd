import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/account_delete/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/account_delete/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/app_bar_more_actions.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/icon_with_text.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/extensions/build_context_extension.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
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
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
// TOOD test
    final PlayerPreferencesController _playerPreferencesController = ref.read(
      playerPreferencesAppControllerProvider.notifier,
    );
    final AccountDeleteController _accountDeleteController =
        ref.read(accountDeleteAppControllerProvider.notifier);

    final AsyncValue<void> preferencesState =
        ref.watch(playerPreferencesAppControllerProvider);

    ref.listen(accountDeleteAppControllerProvider, (
      AsyncValue<void>? previous,
      AsyncValue<void> next,
    ) {
// TODO make function out of this

      next.when(
        data: (data) {
          // TOOD here we would navigate to logout
        },
        error: (error, stackTrace) {
          // TODO here shown some message that thing failed
          context.showSnackBarMessage(
            "There was an error deleting your account",
            SnackBarVariant.error,
          );

          // but still logout with auth controller
          // TODO but still go to logout
        },
        loading: () async {
          await showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (
              context,
            ) {
              return Dialog(
                child: Container(
                  padding: EdgeInsets.all(SpacingConstants.medium),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Loading...",
                        style: textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: SpacingConstants.medium,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    });

// TODO test this is not good here
    // ref.listen(playerPreferencesAppControllerProvider, (
    //   AsyncValue<void>? prevState,
    //   AsyncValue<void> nextState,
    // ) async {
    //   int some = 3;
    //   nextState.maybeWhen(
    //     orElse: () {
    //       // TOOD test
    //       log("nextState.maybeWhen orElse");
    //     },
    //     loading: () async {
    //       some = 2;
    //       await showDialog<void>(
    //         context: context,
    //         barrierDismissible: false,
    //         builder: (
    //           context,
    //         ) {
    //           return Dialog(
    //             child: Container(
    //               padding: EdgeInsets.all(SpacingConstants.medium),
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Text(
    //                     "Loading...",
    //                     style: textTheme.titleLarge!.copyWith(
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: SpacingConstants.medium,
    //                   ),
    //                   CircularProgressIndicator(),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       );
    //     },
    //   );
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text("Let's set you up"),
        actions: [
          preferencesState.maybeWhen(
            orElse: () => SizedBox.shrink(),
            loading: () {
              return Center(
                child: SizedBox(
                  height: DimensionsConstants.d20,
                  width: DimensionsConstants.d20,
                  child: CircularProgressIndicator(
                    color: ColorConstants.grey4,
                    strokeWidth: 3,
                  ),
                ),
              );
            },
          ),
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
                    height: SpacingConstants.small,
                  ),
                  Divider(),
                  _PreferencesTeamSection(),
                  SizedBox(
                    height: SpacingConstants.small,
                  ),
                  Divider(),
                  _PreferencesRegionAreaSection(
                    regionSizeStream:
                        _playerPreferencesController.regionSizeStream,
                    onRegionSizeChanged:
                        _playerPreferencesController.onChangeRegionSize,
                  ),
                  SizedBox(
                    height: SpacingConstants.small,
                  ),
                  Divider(),
                  SizedBox(
                    height: SpacingConstants.small,
                  ),
                  _PreferencesDangerZoneSection(
                    regionSizeStream:
                        _playerPreferencesController.regionSizeStream,
                    onRegionSizeChanged:
                        _playerPreferencesController.onChangeRegionSize,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreferencesDangerZoneSection extends StatelessWidget {
  const _PreferencesDangerZoneSection({
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

    return Container(
      padding: const EdgeInsets.all(SpacingConstants.medium),
      decoration: BoxDecoration(
        color: ColorConstants.black,
        borderRadius: BorderRadius.circular(
          DimensionsConstants.d10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Danger Zone',
            style: textTheme.titleMedium!.copyWith(
              color: ColorConstants.white,
            ),
          ),
          SizedBox(
            height: SpacingConstants.small,
          ),
          Divider(
            color: ColorConstants.grey4,
          ),
          GestureDetector(
            onTap: _onTapDeleteAccount(context),
            // onTap: () {
            //   // TODO test
            // },
            child: IconWithText(
              icon: Icons.delete,
              iconSize: FontSizeConstants.mediumLarge,
              iconColor: ColorConstants.red,
              text: "Delete account",
              textStyle: textTheme.bodySmall!.copyWith(
                color: ColorConstants.grey1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // TODO test
  Future<void> Function() _onTapDeleteAccount(BuildContext context) =>
      () async {
        // TODO show a dialog

        // TODO this could actually conditionally render some dialog based on the state

        final ThemeData theme = Theme.of(context);
        final TextTheme textTheme = theme.textTheme;

        final bool? shouldDeleteAccount = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.spaceBetween,
              contentPadding: EdgeInsets.all(SpacingConstants.medium),
              title: Text(
                "Delete account",
                textAlign: TextAlign.center,
              ),
              content: Container(
                padding: EdgeInsets.all(SpacingConstants.medium),
                decoration: BoxDecoration(
                  color: ColorConstants.yellow,
                  borderRadius: BorderRadius.circular(DimensionsConstants.d10),
                ),
                child: Text(
                  "Deleting your account will remove you from all matches where you are registered as a participant.\n\nYour created matches will still be available for others, but you will be removed as the organizer.",
                  style: textTheme.bodySmall!.copyWith(
                    color: ColorConstants.grey5,
                  ),
                ),
              ),
              actions: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text("Cancel"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: ColorConstants.black,
                      side: BorderSide(
                        color: ColorConstants.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.red,
                      foregroundColor: ColorConstants.white,
                    ),
                    onPressed: () {
                      // Navigator.of(context).pop(true);
                    },
                    child: Text("Delete"),
                  ),
                ),
              ],
            );
          },
        );

        if (shouldDeleteAccount != true) {
          return;
        }
        // TODO if they cancel, do nothing

        // TODO if they confirm, delete the account
        // call controller function for this - and then possible also show some kind of loading indicator

        // TODO call function here
        // we could show another dialog here, with a loading indicator
      };
}

// TODO create view

// TOOD make all of these sections into their own files

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
        SizedBox(height: SpacingConstants.xxSmall),
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
