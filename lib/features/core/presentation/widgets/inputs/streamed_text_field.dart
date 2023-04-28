import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StreamedTextField extends StatelessWidget {
  const StreamedTextField({
    super.key,
    required this.fieldController,
    required this.stream,
    required this.onChanged,
    required this.labelText,
  });

  final TextEditingController fieldController;
  final Stream<String?> stream;
  final ValueSetter<String> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;

        return TextField(
          controller: fieldController,
          onChanged: (value) {
            onChanged(value);
          },
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: hasError ? ColorConstants.red : ColorConstants.grey,
            ),
          ),
        );
      },
      stream: stream,
    );
  }
}
