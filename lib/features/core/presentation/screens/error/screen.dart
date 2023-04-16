
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
    required this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    final String? errorMessage = message;
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Uuups, there seems to have been an issue.."),
            SizedBox(
              height: SpacingConstants.medium,
            ),
            if (errorMessage != null) Text(errorMessage),
          ],
        ),
      ),
    );
  }
}
