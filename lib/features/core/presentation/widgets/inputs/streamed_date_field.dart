import 'package:five_on_four_flutter_tdd/features/core/utils/extensions/date_time_extension.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StreamedDateField extends StatelessWidget {
  const StreamedDateField({
    super.key,
    required this.fieldController,
    required this.stream,
    required this.onChanged,
    required this.labelText,
  });

  final TextEditingController fieldController;
  final Stream<DateTime?> stream;
  final ValueSetter<DateTime?> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime?>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;

        return TextField(
          readOnly: true,
          controller: fieldController,
          decoration: InputDecoration(
            icon: Icon(
              Icons.calendar_today,
              color: ColorConstants.white,
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: hasError ? ColorConstants.red : ColorConstants.grey3,
            ),
          ),
          onTap: () async {
            final DateTime dateNow = DateTime.now();

            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: dateNow,
              firstDate: dateNow,
              lastDate: dateNow.add(Duration(days: 365)),
            );

            if (pickedDate == null) {
              onChanged(null);
              fieldController.text = "";

              return;
            }

// TODO create formatter on date as extension
            // final String formattedDate =
            //     DateFormat("dd-MM-yyyy").format(pickedDate);

            onChanged(pickedDate);
            fieldController.text = pickedDate.asDateFormalFormattedString;
          },
        );
      },
      stream: stream,
    );
  }
}
