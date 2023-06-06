import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class ScreenMainTitle extends StatelessWidget {
  const ScreenMainTitle({
    super.key,
    required this.primaryLeadingLabel,
    required this.primaryTrailingLabel,
    required this.secondaryLeadingLabel,
    required this.secondaryTrailingLabel,
  });

  final String primaryLeadingLabel;
  final String primaryTrailingLabel;
  final String secondaryLeadingLabel;
  final String secondaryTrailingLabel;
  // TODO photo will be here later

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: textTheme.displayMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: primaryLeadingLabel,
                      style: TextStyle(
                        color: ColorConstants.white,
                      ),
                    ),
                    TextSpan(
                      text: primaryTrailingLabel,
                      style: TextStyle(
                        color: ColorConstants.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SpacingConstants.small,
              ),
              Text.rich(
                TextSpan(
                  style: textTheme.titleMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: secondaryLeadingLabel,
                      style: TextStyle(
                        color: ColorConstants.white,
                      ),
                    ),
                    TextSpan(
                      text: secondaryTrailingLabel,
                      style: TextStyle(
                        color: ColorConstants.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // TODO make and use MediaModel, to be used everywhere for media
        // TODO tests will fail because of media fetching
        Container(
          width: DimensionsConstants.d60,
          height: DimensionsConstants.d60,
          decoration: BoxDecoration(
            color: ColorConstants.red,
            borderRadius: BorderRadius.circular(DimensionsConstants.d10),
          ),
        ),
      ],
    );
  }
}
