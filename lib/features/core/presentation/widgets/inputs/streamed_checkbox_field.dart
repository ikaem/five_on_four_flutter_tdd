import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';

class StreamedCheckbox extends StatelessWidget {
  const StreamedCheckbox({
    super.key,
    required this.stream,
    required this.onChanged,
    required this.labelText,
  });

  final Stream<bool> stream;
  final ValueSetter<bool?> onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    return StreamBuilder<bool>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;
        final bool? data = snapshot.data;

        return Row(
          children: [
            Text(
              labelText,
              style: themeText.bodySmall!.copyWith(
                  color: hasError ? ColorConstants.red : ColorConstants.white),
            ),
            Checkbox(
              value: data ?? false,
              onChanged: onChanged,
            ),
          ],
        );
      },
      stream: stream,
    );
  }
}
