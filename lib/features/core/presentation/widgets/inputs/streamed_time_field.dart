import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_time_field.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export "package:five_on_four_flutter_tdd/features/core/utils/utils.dart";

class StreamedTimeField extends StatelessWidget {
  const StreamedTimeField({
    super.key,
    required this.fieldController,
    required this.stream,
    required this.onChanged,
    required this.labelText,
  });

  final TextEditingController fieldController;
  final Stream<TimeOfDay?> stream;
  final ValueSetter<TimeOfDay?> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TimeOfDay?>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;
        return TextField(
          readOnly: true,
          controller: fieldController,
          decoration: InputDecoration(
            icon: Icon(
              Icons.access_time,
              color: ColorConstants.white,
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: hasError ? ColorConstants.red : ColorConstants.grey3,
            ),
          ),
          onTap: () async {
            final TimeOfDay timeOfDay = TimeOfDay.now();

            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: timeOfDay,
            );

            if (pickedTime == null) {
              onChanged(null);
              fieldController.text = "";

              return;
            }

            final DateTime picketTimeWithTodayDate = pickedTime.toTodayDateTime;

            final String formattedTime =
                DateFormat("h:mm a").format(picketTimeWithTodayDate);

            onChanged(pickedTime);
            fieldController.text = formattedTime;
          },
        );
      },
      stream: stream,
    );
  }
}
