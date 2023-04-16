import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/font_size_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/theme.dart';
import 'package:flutter/material.dart';

class MatchInfoVenueOverview extends StatelessWidget {
  const MatchInfoVenueOverview({
    super.key,
  });

// TODO all of this we need - we will have this later
  // final LocationModel location;
  // final WeatherModel weather;
  // TODO add extensions on datetime to format it as we need it here
  // final DateTime startsAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      padding: EdgeInsets.all(SpacingConstants.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text("Location:"),
              SizedBox(
                height: SpacingConstants.medium,
              ),
              Text("Some location name here"),
              Text("Some location name here"),
              Text("Some location name here"),
            ],
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Column(
            children: [
              Text("Time:"),
              SizedBox(
                height: SpacingConstants.medium,
              ),
              Text("23 January, 2023, 16:00"),
            ],
          ),
          SizedBox(
            height: SpacingConstants.medium,
          ),
          Column(
            children: [
              Text("Weather:"),
              SizedBox(
                height: SpacingConstants.medium,
              ),
              Row(
                children: [
                  Text("Sunny"),
                  Icon(
                    Icons.sunny,
                    size: FontSizeConstants.xxxLarge,
                    color: ColorConstants.white,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
