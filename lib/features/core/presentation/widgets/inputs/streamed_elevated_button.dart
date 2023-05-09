import 'package:flutter/material.dart';

class StreamedElevatedButton extends StatelessWidget {
  const StreamedElevatedButton({
    super.key,
    required this.enabledStateStream,
    required this.onPressed,
    required this.label,
  });

  final Stream<bool> enabledStateStream;
  final VoidCallback? onPressed;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;
        final bool isEnabled = !hasError && snapshot.data == true;

        return ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          child: label,
        );
      },
      stream: enabledStateStream,
    );
  }
}
