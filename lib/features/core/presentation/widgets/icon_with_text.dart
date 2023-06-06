import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

// TODO not sure, maybe this should go enums as a general thing
enum IconSize {
  small(iconSize: 16.0),
  medium(iconSize: 24.0),
  large(iconSize: 32.0);

  const IconSize({
    required this.iconSize,
  });

  final double iconSize;
}

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    // TODO leave out for now
    // required this.isIconLeading,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.textStyle,
    this.iconSize = FontSizeConstants.xLarge,
    // this.iconSize = IconSize.medium,
  });

  // final bool isIconLeading;
  final IconData icon;
  final Color iconColor;
  final String text;
  final TextStyle? textStyle;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final List<Widget> elements = [
      Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      SizedBox(
        width: SpacingConstants.small,
      ),
      Expanded(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    ];

    // elements/*  */

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // textBaseline: TextBaseline.alphabetic,
      children: elements,
    );
  }
}
