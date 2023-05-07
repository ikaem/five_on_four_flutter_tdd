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
    // TODO this will also need to disable all inputs somehow while loading
    final MatchCreateController matchCreateController =
        ref.read(matchCreateAppControllerProvider.notifier);
    final AsyncValue<String?> matchCreateValue =
        ref.watch(matchCreateAppControllerProvider);

    ref.listen(
        matchCreateAppControllerProvider, _matchCreatedListener(context));

    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final TextStyle sectionLabelStyle = themeText.labelMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          matchCreateValue.when(
            loading: () => Center(child: CircularProgressIndicator()),
            error: (e, st) => SizedBox.shrink(),
            data: (String? matchId) {
              if (matchId != null) return SizedBox.shrink();

              return StreamedIconButton(
                stream: matchCreateController.inputsValidationStream,
                onPressed: matchCreateController.onSubmit,
                icon: Icons.check,
              );
            },
          ),
          // TODO come back to this
          // Consumer(
          //   builder: (context, ref, child) {
          //     ref.listen(
          //       matchCreateAppControllerProvider,
          //       (previous, next) {
          //         next.when(
          //           data: (matchId) {
          //             if (matchId == null) return;

          //             context.pushReplacementNamed(
          //               AppRoutes.matchInfoScreenRouteValue.name,
          //               params: {
          //                 AppConstants.idKey: matchId,
          //               },
          //             );
          //           },
          //           error: (error, stackTrace) => context.showSnackBarMessage(
          //               "There was an issue creating the match"),
          //           loading: () => null,
          //         );
          //       },
          //     );

          //     final AsyncValue<String?> matchCreateValue =
          //         ref.watch(matchCreateAppControllerProvider);

          //     return matchCreateValue.when(
          //       loading: () => Center(child: CircularProgressIndicator()),
          //       error: (e, st) => SizedBox.shrink(),
          //       data: (data) => Center(
          //         child: Text("Some data: $data"),
          //       ),
          //     );
          //   },
          // ),
          // StreamedIconButton(
          //   stream: matchCreateController.inputsValidationStream,
          //   onPressed: matchCreateController.onSubmit,
          //   icon: Icons.check,
          // ),
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
                if (matchId == null) return;

                context.pushReplacementNamed(
                  AppRoutes.matchInfoScreenRouteValue.name,
                  params: {
                    AppConstants.idKey: matchId,
                  },
                );
              },
              error: (error, stackTrace) => context
                  .showSnackBarMessage("There was an issue creating the match"),
              loading: () => null,
            );
          };
}
