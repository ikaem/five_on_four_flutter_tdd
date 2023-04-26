import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_icon_button.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/extensions/build_context_extension.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/controller.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/basic_inputs.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_inputs.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MatchCreateScreenView extends ConsumerWidget {
  const MatchCreateScreenView();

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // TODO not sure if should read or watch here - im thinking read
    final MatchCreateController matchCreateController =
        ref.read(matchCreateAppControllerProvider.notifier);

    // TODO this will also need to disable all inputs somehow while loading

// TODO this needs value, and it needs the notifier itself
    // final PlayersSearchController playersSearchController =
    //     ref.watch(playersSearchAppControllerProvider);

    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final TextStyle sectionLabelStyle = themeText.labelMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(
            builder: (context, ref, child) {
              // TODO extract this elsewhere
              ref.listen(
                matchCreateAppControllerProvider,
                (previous, next) {
                  next.when(
                    data: (matchId) {
                      context.pushReplacementNamed(
                        AppRoutes.matchInfoScreenRouteValue.name,
                        params: {
                          // TODO should use this id as constnats somewhere
                          AppConstants.idKey: matchId,
                        },
                      );
                    },
                    error: (error, stackTrace) => context.showSnackBarMessage(
                        "There was an issue creating the match"),
                    loading: () => null,
                  );
// TODO changed state
                },
              );

              final AsyncValue<String> matchCreateValue =
                  ref.watch(matchCreateAppControllerProvider);

              return matchCreateValue.when(
                loading: () => Center(child: CircularProgressIndicator()),
                error: (e, st) => SizedBox.shrink(),
                data: (data) => Center(
                  child: Text("Some data: $data"),
                ),
              );
            },
          ),
          StreamedIconButton(
            stream: matchCreateController.inputsValidationStream,
            onPressed: matchCreateController.onSubmit,
            icon: Icons.check,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: ListView(
          children: [
            Text(
                "Some match info  that will be wrapped in a stream of match name value"),

            TextButton(
              onPressed: () {
                context.pushNamed(
                  AppRoutes.errorScreenRouteValue.name,
                  params: {
                    "error_message": "",
                  },
                );
              },
              child: Text("Go to error page"),
            ),
            // TODO go to error screen
            MatchCreateBasicInputs(
              sectionLabelStyle: sectionLabelStyle.copyWith(
                color: ColorConstants.yellow,
              ),
              matchNameStream: matchCreateController.matchNameValidationStream,
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
              //
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
              height: SpacingConstants.small,
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
}
