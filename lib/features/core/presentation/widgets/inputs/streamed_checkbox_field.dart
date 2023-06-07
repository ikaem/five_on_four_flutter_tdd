import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StreamedCheckbox extends StatelessWidget {
  const StreamedCheckbox({
    super.key,
    required this.stream,
    required this.onChanged,
    required this.labelText,
    required this.labelStyle,
  });

  final Stream<bool> stream;
  final ValueSetter<bool?> onChanged;
  final String labelText;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;
        final bool? data = snapshot.data;

        final TextStyle style = hasError
            ? labelStyle.copyWith(color: ColorConstants.red)
            : labelStyle;

        return Row(
          children: [
            Text(
              labelText,
              style: style,
            ),
            Checkbox(
                value: data ?? false,
                onChanged: onChanged,
                side: BorderSide(
                  color: hasError ? ColorConstants.red : ColorConstants.white,
                )),
          ],
        );
      },
      stream: stream,
    );
  }
}
