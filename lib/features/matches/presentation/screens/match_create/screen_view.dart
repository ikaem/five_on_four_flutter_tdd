import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_icon_button.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/controller.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/basic_inputs.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_create/players_invite_inputs.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchCreateScreenView extends ConsumerWidget {
  const MatchCreateScreenView();

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final MatchCreateController matchCreateController =
        ref.watch(matchCreateAppControllerProvider.notifier);

    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final TextStyle sectionLabelStyle = themeText.labelMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
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
