// TODO test - move this to a separate file
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:flutter/material.dart';

class MatchInfoTitleOverview extends StatelessWidget {
  const MatchInfoTitleOverview({
    super.key,
    required this.title,
  });

  final String title;
  // TODO this should come in later - it should be on the match in form of player model
  // final PlayerModel organizer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text("match:"),
              Text(title),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "organized by:"),
                    TextSpan(
                      text: "Miki Rapaić",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        // TODO eventually add image here
        Container(
          width: DimensionsConstants.d50,
          height: DimensionsConstants.d50,
          decoration: BoxDecoration(
            color: ColorConstants.red,
          ),
        ),
      ],
    );
  }
}
