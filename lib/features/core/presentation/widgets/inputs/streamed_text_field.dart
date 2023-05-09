import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StreamedTextField extends StatelessWidget {
  const StreamedTextField({
    super.key,
    required this.fieldController,
    required this.stream,
    required this.onChanged,
    required this.labelText,
    this.inputType = TextInputType.text,
    this.hidden = false,
  });

  final TextEditingController fieldController;
  final Stream<String?> stream;
  final ValueSetter<String> onChanged;
  final String labelText;
  final TextInputType inputType;
  final bool hidden;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;

        return TextField(
          obscureText: hidden,
          keyboardType: inputType,
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
