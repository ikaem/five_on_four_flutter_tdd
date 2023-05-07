import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_date_field.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_text_field.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_time_field.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/inputs/streamed_checkbox_field.dart';

class MatchCreateBasicInputs extends StatefulWidget {
  const MatchCreateBasicInputs({
    super.key,
    required this.sectionLabelStyle,

    // input streams
    required this.matchNameStream,
    required this.locationNameStream,
    required this.locationAddressStream,
    required this.locationCityStream,
    required this.locationCountryStream,
    required this.dateStream,
    required this.timeStream,
    required this.joinMatchStream,

    // change handlers
    required this.onChangeMatchName,
    required this.onLocationNameChange,
    required this.onLocationAddressChange,
    required this.onLocationCityChange,
    required this.onLocationCountryChange,
    required this.onDateChange,
    required this.onTimeChange,
    required this.onJoinMatchChange,
  });

  final TextStyle sectionLabelStyle;

  final Stream<String> matchNameStream;
  final Stream<String> locationNameStream;
  final Stream<String> locationAddressStream;
  final Stream<String> locationCityStream;
  final Stream<String> locationCountryStream;
  final Stream<DateTime?> dateStream;
  final Stream<TimeOfDay?> timeStream;
  final Stream<bool> joinMatchStream;

  final ValueSetter<String> onChangeMatchName;
  final ValueSetter<String> onLocationNameChange;
  final ValueSetter<String> onLocationAddressChange;
  final ValueSetter<String> onLocationCityChange;
  final ValueSetter<String> onLocationCountryChange;
  final ValueSetter<DateTime?> onDateChange;
  final ValueSetter<TimeOfDay?> onTimeChange;
  final ValueSetter<bool?> onJoinMatchChange;

  @override
  State<MatchCreateBasicInputs> createState() => _MatchCreateBasicInputsState();
}

class _MatchCreateBasicInputsState extends State<MatchCreateBasicInputs> {
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
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamedTextField(
            fieldController: _matchNameController,
            stream: Stream.value(""),
            onChanged: widget.onChangeMatchName,
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
            stream: widget.locationNameStream,
            onChanged: widget.onLocationNameChange,
            labelText: "Location name",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: _addressController,
            stream: widget.locationAddressStream,
            onChanged: widget.onLocationAddressChange,
            labelText: "Address",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: _cityController,
            stream: widget.locationCityStream,
            onChanged: widget.onLocationCityChange,
            labelText: "City",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: _countryController,
            stream: widget.locationCountryStream,
            onChanged: widget.onLocationCountryChange,
            labelText: "Country",
          ),
          SizedBox(
            height: SpacingConstants.large,
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
            stream: widget.dateStream,
            onChanged: widget.onDateChange,
            labelText: "Select date",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTimeField(
            fieldController: _timeController,
            stream: widget.timeStream,
            onChanged: widget.onTimeChange,
            labelText: "Select time",
          ),
          SizedBox(
            height: SpacingConstants.large,
          ),
          StreamedCheckbox(
            stream: widget.joinMatchStream,
            onChanged: widget.onJoinMatchChange,
            labelText: "Join the match",
          )
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
