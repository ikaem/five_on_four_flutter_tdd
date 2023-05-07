import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class SearchFilterWrapper extends StatelessWidget {
  const SearchFilterWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    return Container(
      padding: EdgeInsets.all(SpacingConstants.xSmall),
      decoration: BoxDecoration(
        color: ColorConstants.yellow,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: SpacingConstants.small,
          ),
          child,
        ],
      ),
    );
  }
}
