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
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: textTheme.bodyLarge,
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
                  style: textTheme.bodySmall,
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
        Container(
          width: DimensionsConstants.d50,
          height: DimensionsConstants.d50,
          decoration: BoxDecoration(
            color: ColorConstants.red,
            // borderRadius: BorderRadius.circular(DimensionsConstants.d10),
          ),
          // TODO test fails because of this - come back to it
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(DimensionsConstants.d10),
          //   child: Image.network(
          //     'https://picsum.photos/200/300',
          //     fit: BoxFit.cover,
          //     loadingBuilder: (context, child, loadingProgress) {
          //       if (loadingProgress == null) return child;

          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     },
          //     errorBuilder: (context, error, stackTrace) => Center(
          //       child: Icon(Icons.error),
          //     ),
          //   ),
          // ),
          // TODO now we want to render some image from a network here
        ),
      ],
    );
    ;
  }
}
