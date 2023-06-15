import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/player_preferences/provider/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_icon_button.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/extensions/build_context_extension.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/controller.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/basic_inputs.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_inputs.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// FUTURE create content widget for this
class MatchCreateScreenView extends ConsumerWidget {
  const MatchCreateScreenView();

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // FUTURE this will also need to disable all inputs somehow while loading
    final MatchCreateController matchCreateController =
        ref.read(matchCreateAppControllerProvider.notifier);

    final PlayerPreferencesController playerPreferencesController = ref.read(
      playerPreferencesAppControllerProvider.notifier,
    );

    final AsyncValue<String?> matchCreateValue =
        ref.watch(matchCreateAppControllerProvider);

    ref.listen(
        matchCreateAppControllerProvider, _matchCreatedListener(context));

    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final TextStyle sectionLabelStyle = themeText.titleMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          StreamedIconButton(
            enabledStateStream: matchCreateController.inputsValidationStream,
            onPressed: matchCreateController.onSubmit,
            icon: Icons.check,
          ),

          // TODO revert this
          // matchCreateValue.when(
          //   loading: () => Center(child: CircularProgressIndicator()),
          //   error: (e, st) => SizedBox.shrink(),
          //   data: (String? matchId) {
          //     // TODO revert this
          //     // if (matchId != null) return SizedBox.shrink();

          //     return StreamedIconButton(
          //       enabledStateStream:
          //           matchCreateController.inputsValidationStream,
          //       onPressed: matchCreateController.onSubmit,
          //       icon: Icons.check,
          //     );
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: ListView(
          children: [
            SizedBox(
              height: SpacingConstants.mediumLarge,
            ),
            // TODO make widget out of this
            StreamBuilder<String>(
                stream: matchCreateController.nameValidationStream,
                builder: (context, snapshot) {
                  final String matchName = snapshot.data ?? "...";
                  return ScreenMainTitle(
                    primaryLeadingLabel: "Match: ",
                    primaryTrailingLabel: matchName,
                    secondaryLeadingLabel: "organized by: ",
                    secondaryTrailingLabel:
                        playerPreferencesController.currentPlayerNickname,
                  );
                }),
            SizedBox(
              height: SpacingConstants.xLarge,
            ),
            MatchCreateBasicInputs(
              sectionLabelStyle: sectionLabelStyle.copyWith(
                color: ColorConstants.yellow,
              ),
              nameStream: matchCreateController.nameValidationStream,
              locationNameStream:
                  matchCreateController.locationNameValidationStream,
              locationAddressStream:
                  matchCreateController.locationAddressValidationStream,
              locationCityStream:
                  matchCreateController.locationCityValidationStream,
              locationCountryStream:
                  matchCreateController.locationCountryValidationStream,
              dateStream: matchCreateController.dateValidationStream,
              timeStream: matchCreateController.timeValidationStream,
              joinMatchStream: matchCreateController.joinMatchValidationStream,
              onChangeMatchName: matchCreateController.onChangeMatchName,
              onLocationNameChange: matchCreateController.onLocationNameChange,
              onLocationAddressChange:
                  matchCreateController.onLocationAddressChange,
              onLocationCityChange: matchCreateController.onLocationCityChange,
              onLocationCountryChange:
                  matchCreateController.onLocationCountryChange,
              onDateChange: matchCreateController.onDateChange,
              onTimeChange: matchCreateController.onTimeChange,
              onJoinMatchChange: matchCreateController.onJoinMatchChange,
            ),
            SizedBox(
              height: SpacingConstants.large,
            ),
            MatchCreatePlayersInviteInputs(
              sectionLabelStyle: sectionLabelStyle.copyWith(
                color: ColorConstants.black,
              ),
              participantsInvitationsStream:
                  matchCreateController.participantInvitationsStream,
              onAddParticipantInvitation:
                  matchCreateController.onAddParticipantInvitation,
              onRemoveParticipantInvitation:
                  matchCreateController.onRemoveParticipantInvitation,
            )
          ],
        ),
      ),
    );
  }

  void Function(AsyncValue<String?>?, AsyncValue<String?>)
      _matchCreatedListener(
    BuildContext context,
  ) =>
          (
            prevState,
            currentState,
          ) {
            currentState.when(
              data: (matchId) {
                // TODO revert this
                if (matchId == null) return;

                // TODO revert this
                // context.pushReplacementNamed(
                //   AppRoutes.matchInfoScreenRouteValue.name,
                //   pathParameters: {
                //     AppConstants.idKey: matchId,
                //   },
                // );
              },
              error: (error, stackTrace) => context
                  .showSnackBarMessage("There was an issue creating the match"),
              loading: () => null,
            );
          };
}
