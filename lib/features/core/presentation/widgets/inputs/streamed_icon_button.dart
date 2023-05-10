import 'package:flutter/material.dart';

class StreamedIconButton extends StatelessWidget {
  const StreamedIconButton({
    super.key,
    required this.enabledStateStream,
    required this.onPressed,
    required this.icon,
  });

  final Stream<bool> enabledStateStream;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      builder: (context, snapshot) {
        final bool hasError = snapshot.hasError;
        final bool isEnabled = !hasError && snapshot.data == true;

        return IconButton(
          onPressed: isEnabled ? onPressed : null,
          // onPressed: onPressed,
          icon: Icon(
            Icons.check,
          ),
        );
      },
      stream: enabledStateStream,
    );
  }
}
