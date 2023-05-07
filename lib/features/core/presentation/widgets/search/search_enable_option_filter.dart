import 'package:flutter/material.dart';

class SearchEnableOptionFilter extends StatelessWidget {
  const SearchEnableOptionFilter({
    super.key,
    required this.labelTextStyle,
  });

  final TextStyle labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Some filter:",
          style: labelTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        )
      ],
    );
  }
}
