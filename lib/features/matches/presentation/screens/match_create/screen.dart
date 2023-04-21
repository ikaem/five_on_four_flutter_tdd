import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_date_field.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_text_field.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_time_field.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/enums/match_participant_status.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_participant/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_create/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_participant_brief_card.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchCreateScreen extends ConsumerWidget {
  const MatchCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final MatchCreateAppController matchCreateController =
    //     ref.watch(matchCreateAppControllerProvider.notifier);

    // final Stream<String> matchNameStream =
    //     matchCreateController.matchNameStream;
    // final Stream<String> locationNameStream =
    //     matchCreateController.locationNameStream;
    // final Stream<String> locationAddressStream =
    //     matchCreateController.locationAddressStream;
    // final Stream<String> locationCityStream =
    //     matchCreateController.locationCityStream;
    // final Stream<String> locationCountryStream =
    //     matchCreateController.locationCountryStream;
    // final Stream<DateTime?> dateStream = matchCreateController.dateStream;
    // final Stream<TimeOfDay> timeStream = matchCreateController.timeStream;

    return MatchCreateScreenView(
        // matchNameStream: matchNameStream,
        // locationNameStream: locationNameStream,
        );
  }
}

// TODO move to its own file later
class MatchCreateScreenView extends ConsumerWidget {
  const MatchCreateScreenView(

      //   {
      //   super.key,
      //   required this.matchNameStream,
      //   required this.locationNameStream,
      //   required this.locationAddressStream,
      //   required this.locationCityStream,
      //   required this.locationCountryStream,
      //   required this.dateStream,
      //   required this.timeStream,
      // }
      );

  // final Stream<String> matchNameStream;
  // final Stream<String> locationNameStream;
  // final Stream<String> locationAddressStream;
  // final Stream<String> locationCityStream;
  // final Stream<String> locationCountryStream;
  // final Stream<DateTime?> dateStream;
  // final Stream<TimeOfDay> timeStream;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
// TODO test
    final MatchCreateAppController matchCreateController =
        ref.watch(matchCreateAppControllerProvider.notifier);

    final Stream<String> matchNameStream =
        matchCreateController.matchNameStream;
    final Stream<String> locationNameStream =
        matchCreateController.locationNameStream;
    final Stream<String> locationAddressStream =
        matchCreateController.locationAddressStream;
    final Stream<String> locationCityStream =
        matchCreateController.locationCityStream;
    final Stream<String> locationCountryStream =
        matchCreateController.locationCountryStream;
    final Stream<DateTime?> dateStream = matchCreateController.dateStream;
    final Stream<TimeOfDay> timeStream = matchCreateController.timeStream;

    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    final TextStyle sectionLabelStyle = themeText.labelMedium!.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: ListView(
          children: [
            Text(
                "Some match info  that will be wrapped in a stream of match name value"),
            // TODO make this its own widget
            MatchCreateBasicInputs(
              sectionLabelStyle: sectionLabelStyle.copyWith(
                color: ColorConstants.yellow,
              ),
            ),
            SizedBox(
              height: SpacingConstants.small,
            ),
            // TODO his will also be wrapped in stream builder maybe, to rebuild?
            MatchCreatePlayersInviteInputs(
              sectionLabelStyle: sectionLabelStyle.copyWith(
                color: ColorConstants.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MatchCreatePlayersInviteInputs extends StatelessWidget {
  const MatchCreatePlayersInviteInputs({
    super.key,
    required this.sectionLabelStyle,
  });

  final TextStyle sectionLabelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.medium),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Invited players",
                style: sectionLabelStyle,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_circle,
                  color: ColorConstants.red,
                ),
              ),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 15,
            separatorBuilder: (context, index) => SizedBox(
              height: SpacingConstants.medium,
            ),
            itemBuilder: (context, index) {
              // return Text("Try me");

              final MatchParticipantModel matchParticipant =
                  MatchParticipantModel(
                createdAt: DateTime.now().millisecondsSinceEpoch,
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                userId: DateTime.now().millisecondsSinceEpoch.toString(),
                nickname: "Participant $index",
                status: MatchParticipantStatus.invited,
                invitationExpirationTime: DateTime.now()
                    .add(Duration(days: 7))
                    .millisecondsSinceEpoch,
              );

              return MatchParticipantBriefCard(
                matchParticipant: matchParticipant,
              );
            },
          ),
        ],
      ),
    );
  }
}

// TODO move this elsewhere of make private
class MatchCreateBasicInputs extends StatefulWidget {
  const MatchCreateBasicInputs({
    super.key,
    required this.sectionLabelStyle,
  });

  final TextStyle sectionLabelStyle;

  @override
  State<MatchCreateBasicInputs> createState() => _MatchCreateBasicInputsState();
}

class _MatchCreateBasicInputsState extends State<MatchCreateBasicInputs> {
// TODO not sure if we need the controllers - we will have data in the provider instead

  final TextEditingController _matchNameController = TextEditingController();
  final TextEditingController _locationNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void dispose() {
    _disposeWidget();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO potentually“, tis should access its own provider streams
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    // final TextStyle sectionLabelStyle = themeText.labelMedium!.copyWith(
    //   color: ColorConstants.yellow,
    //   fontWeight: FontWeight.bold,
    // );

    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO all of these need to be wrapped in their own streams for validation - will need to create some helpers for validat
          // TODO this could potentially be a custom widget
          // TextField(
          //   decoration: InputDecoration(
          //     labelText: "Match name",
          //     // labelStyle: TextStyle(color: ColorConstants.white),
          //     // enabledBorder: UnderlineInputBorder(
          //     //   borderSide: BorderSide(
          //     //     color: ColorConstants.white,
          //     //     width: 2.0,
          //     //   ),
          //     // ),
          //   ),
          // ),
          StreamedTextField(
            fieldController: _matchNameController,
            // TODO just for testing
            // stream: StreamController<String>().stream,
            stream: Stream.value(""),
            onChanged: (value) {},
            labelText: "Match name",
          ),
          SizedBox(
            height: SpacingConstants.xxLarge,
          ),
          Text(
            "location",
            style: widget.sectionLabelStyle,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: _locationNameController,
            // TODO just for testing
            // stream: StreamController<String>().stream,
            stream: Stream.value(""),
            onChanged: (value) {},
            labelText: "Location name",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: _addressController,
            // TODO just for testing
            // stream: StreamController<String>().stream,
            stream: Stream.value(""),
            onChanged: (value) {},
            labelText: "Address",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: _cityController,
            // TODO just for testing
            // stream: StreamController<String>().stream,
            stream: Stream.value(""),
            onChanged: (value) {},
            labelText: "City",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: _countryController,
            // TODO just for testing
            // stream: StreamController<String>().stream,
            stream: Stream.value(""),
            onChanged: (value) {},
            labelText: "Country",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          SizedBox(
            height: SpacingConstants.large,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Text(
            "date & time",
            style: widget.sectionLabelStyle,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedDateField(
            fieldController: _dateController,
            stream: Stream.value(""),
            onChanged: (value) {},
            labelText: "Select date",
          ),
          // TextField(
          //   readOnly: true,
          //   controller: _dateController,
          //   decoration: InputDecoration(
          //     labelText: "Select date",
          //   ),
          //   onTap: () async {
          //     final DateTime dateNow = DateTime.now();

          //     DateTime? pickedDate = await showDatePicker(
          //       context: context,
          //       initialDate: dateNow,
          //       firstDate: dateNow,
          //       lastDate: dateNow.add(Duration(days: 365)),
          //     );

          //     if (pickedDate == null) return;

          //     final String formattedDate =
          //         DateFormat("dd-MM-yyyy").format(pickedDate);

          //     _dateController.text = formattedDate;

          //     // TODO test
          //   },
          // ),
          SizedBox(
            height: SpacingConstants.medium,
          ),

          StreamedTimeField(
            fieldController: _timeController,
            stream: Stream.value(""),
            onChanged: (value) {},
            labelText: "Select time",
          ),
          // TextField(
          //   decoration: InputDecoration(
          //     labelText: "Select time",
          //   ),
          // ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          SizedBox(
            height: SpacingConstants.large,
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Row(
            children: [
              Text(
                "Join the match",
                style: themeText.bodySmall!.copyWith(
                  color: ColorConstants.white,
                ),
              ),
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _disposeWidget() {
    _matchNameController.dispose();
    _locationNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _dateController.dispose();
    _timeController.dispose();
  }
}
