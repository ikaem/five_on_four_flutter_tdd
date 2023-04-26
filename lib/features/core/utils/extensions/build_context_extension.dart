import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';

enum SnackBarVariant { info, error }

extension BuildContextExtension on BuildContext {
  void showSnackBarMessage(
    String message, [
    SnackBarVariant variant = SnackBarVariant.info,
  ]) {
    final Color? backgroundColor =
        variant == SnackBarVariant.error ? ColorConstants.red : null;
    final Color? textColor =
        variant == SnackBarVariant.error ? ColorConstants.white : null;

    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          content: Text(
            message,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      );
  }
}
