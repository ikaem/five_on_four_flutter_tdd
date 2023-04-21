import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StreamedTimeField extends StatelessWidget {
  const StreamedTimeField({
    super.key,
    required this.fieldController,
    required this.stream,
    required this.onChanged,
    required this.labelText,
  });

// TODO not sure if we need the controller
  final TextEditingController fieldController;
  // TODO not sure if this should always be a String - it probably should
  final Stream<String> stream;
  final ValueSetter<String> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;
        return TextField(
          // TODO user should not be able to edit text
          readOnly: true,
          controller: fieldController,
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: Icon(
              Icons.access_time,
              color: ColorConstants.white,
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: hasError ? ColorConstants.red : ColorConstants.grey,
            ),
          ),
          onTap: () async {
            final TimeOfDay timeOfDay = TimeOfDay.now();

            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: timeOfDay,
            );

            if (pickedTime == null) return;

            final DateTime timeWithDate = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              pickedTime.hour,
              pickedTime.minute,
            );

            final String formattedTime =
                DateFormat("h:mm a").format(timeWithDate);

            fieldController.text = formattedTime;
          },
        );
      },
      stream: stream,
    );
  }
}
