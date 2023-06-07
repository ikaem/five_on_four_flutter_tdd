import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_checkbox_field.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_date_field.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_text_field.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_time_field.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';

class MatchCreateBasicInputs extends StatefulWidget {
  const MatchCreateBasicInputs({
    super.key,
    required this.sectionLabelStyle,

    // input streams
    required this.nameStream,
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

  final Stream<String> nameStream;
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
  final TextEditingController _nameController = TextEditingController();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _NameInputs(
          sectionLabelStyle: widget.sectionLabelStyle,
          nameController: _nameController,
          nameStream: widget.nameStream,
          onChangeMatchName: widget.onChangeMatchName,
        ),
        SizedBox(
          height: SpacingConstants.large,
        ),
        _LocationInputs(
          sectionLabelStyle: widget.sectionLabelStyle,
          locationNameController: _locationNameController,
          addressController: _addressController,
          cityController: _cityController,
          countryController: _countryController,
          onLocationNameChange: widget.onLocationNameChange,
          onLocationAddressChange: widget.onLocationAddressChange,
          onLocationCityChange: widget.onLocationCityChange,
          onLocationCountryChange: widget.onLocationCountryChange,
          locationNameStream: widget.locationNameStream,
          locationAddressStream: widget.locationAddressStream,
          locationCityStream: widget.locationCityStream,
          locationCountryStream: widget.locationCountryStream,
        ),
        SizedBox(
          height: SpacingConstants.large,
        ),
        _DateTimeInputs(
          sectionLabelStyle: widget.sectionLabelStyle,
          dateController: _dateController,
          timeController: _timeController,
          onDateChange: widget.onDateChange,
          onTimeChange: widget.onTimeChange,
          dateStream: widget.dateStream,
          timeStream: widget.timeStream,
        ),
        SizedBox(
          height: SpacingConstants.large,
        ),
        _JoinInputs(
          sectionLabelStyle: widget.sectionLabelStyle,
          onJoinMatchChange: widget.onJoinMatchChange,
          joinMatchStream: widget.joinMatchStream,
        ),
      ],
    );
  }

  void _disposeWidget() {
    _nameController.dispose();
    _locationNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _dateController.dispose();
    _timeController.dispose();
  }
}

class _NameInputs extends StatelessWidget {
  const _NameInputs({
    required this.sectionLabelStyle,
    required this.nameController,
    required this.nameStream,
    required this.onChangeMatchName,
  });

  final TextStyle sectionLabelStyle;

  final TextEditingController nameController;
  final Stream<String> nameStream;
  final ValueSetter<String> onChangeMatchName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SpacingConstants.mediumLarge),
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Match name",
            style: sectionLabelStyle,
          ),
          SizedBox(
            height: SpacingConstants.small,
          ),
          Divider(
            color: ColorConstants.grey4,
          ),
          StreamedTextField(
            fieldController: nameController,
            stream: nameStream,
            onChanged: onChangeMatchName,
            labelText: "Match name",
          ),
        ],
      ),
    );
  }
}

class _LocationInputs extends StatelessWidget {
  const _LocationInputs({
    required this.sectionLabelStyle,
    required this.locationNameController,
    required this.addressController,
    required this.cityController,
    required this.countryController,
    required this.onLocationNameChange,
    required this.onLocationAddressChange,
    required this.onLocationCityChange,
    required this.onLocationCountryChange,
    required this.locationNameStream,
    required this.locationAddressStream,
    required this.locationCityStream,
    required this.locationCountryStream,
  });

  final TextStyle sectionLabelStyle;

  final TextEditingController locationNameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController countryController;

  final ValueSetter<String> onLocationNameChange;
  final ValueSetter<String> onLocationAddressChange;
  final ValueSetter<String> onLocationCityChange;
  final ValueSetter<String> onLocationCountryChange;

  final Stream<String> locationNameStream;
  final Stream<String> locationAddressStream;
  final Stream<String> locationCityStream;
  final Stream<String> locationCountryStream;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SpacingConstants.mediumLarge),
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: sectionLabelStyle,
          ),
          SizedBox(
            height: SpacingConstants.small,
          ),
          Divider(
            color: ColorConstants.grey4,
          ),
          StreamedTextField(
            fieldController: locationNameController,
            stream: locationNameStream,
            onChanged: onLocationNameChange,
            labelText: "Location name",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: addressController,
            stream: locationAddressStream,
            onChanged: onLocationAddressChange,
            labelText: "Address",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: cityController,
            stream: locationCityStream,
            onChanged: onLocationCityChange,
            labelText: "City",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTextField(
            fieldController: countryController,
            stream: locationCountryStream,
            onChanged: onLocationCountryChange,
            labelText: "Country",
          ),
        ],
      ),
    );
  }
}

class _DateTimeInputs extends StatelessWidget {
  const _DateTimeInputs({
    required this.sectionLabelStyle,
    required this.dateController,
    required this.timeController,
    required this.onDateChange,
    required this.onTimeChange,
    required this.dateStream,
    required this.timeStream,
  });

  final TextStyle sectionLabelStyle;

  final TextEditingController dateController;
  final TextEditingController timeController;

  final ValueSetter<DateTime?> onDateChange;
  final ValueSetter<TimeOfDay?> onTimeChange;

  final Stream<DateTime?> dateStream;
  final Stream<TimeOfDay?> timeStream;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SpacingConstants.mediumLarge),
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date & Time",
            style: sectionLabelStyle,
          ),
          SizedBox(
            height: SpacingConstants.small,
          ),
          Divider(
            color: ColorConstants.grey4,
          ),
          StreamedDateField(
            fieldController: dateController,
            stream: dateStream,
            onChanged: onDateChange,
            labelText: "Select date",
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          StreamedTimeField(
            fieldController: timeController,
            stream: timeStream,
            onChanged: onTimeChange,
            labelText: "Select time",
          ),
        ],
      ),
    );
  }
}

class _JoinInputs extends StatelessWidget {
  const _JoinInputs({
    required this.sectionLabelStyle,
    required this.onJoinMatchChange,
    required this.joinMatchStream,
  });

  final TextStyle sectionLabelStyle;
  final ValueSetter<bool?> onJoinMatchChange;
  final Stream<bool> joinMatchStream;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SpacingConstants.mediumLarge),
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: StreamedCheckbox(
        labelStyle: sectionLabelStyle,
        stream: joinMatchStream,
        onChanged: onJoinMatchChange,
        labelText: "Join the match",
      ),
    );
  }
}
