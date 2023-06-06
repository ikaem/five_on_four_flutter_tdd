import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:flutter/material.dart';

abstract class AppTextTheme {
  static const TextStyle titleLarge = TextStyle(
    fontSize: FontSizeConstants.large,
    fontWeight: FontWeight.bold,
    // color: ColorConstants.white,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: FontSizeConstants.mediumLarge,
    fontWeight: FontWeight.bold,
    // color: ColorConstants.white,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: FontSizeConstants.medium,
    // fontWeight: FontWeight.bold,
  );

  static const TextStyle displayLarge = TextStyle(
    fontSize: FontSizeConstants.xxxLarge,
    fontWeight: FontWeight.bold,
    // color: ColorConstants.white,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: FontSizeConstants.xxLarge,
    fontWeight: FontWeight.bold,
    // color: ColorConstants.white,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: FontSizeConstants.xLarge,
    fontWeight: FontWeight.bold,
    // color: ColorConstants.white,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: FontSizeConstants.large,
    fontWeight: FontWeight.normal,
    // color: ColorConstants.white,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: FontSizeConstants.mediumLarge,
    fontWeight: FontWeight.normal,
    // color: ColorConstants.white,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: FontSizeConstants.medium,
    fontWeight: FontWeight.normal,
    // color: ColorConstants.white,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: FontSizeConstants.small,
    fontWeight: FontWeight.normal,
    // color: ColorConstants.white,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: FontSizeConstants.xSmall,
    fontWeight: FontWeight.normal,
    // color: ColorConstants.white,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: FontSizeConstants.xxSmall,
    fontWeight: FontWeight.normal,
    // color: ColorConstants.white,
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
  );
}
