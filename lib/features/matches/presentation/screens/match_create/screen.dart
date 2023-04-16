import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchCreateScreen extends ConsumerWidget {
  const MatchCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

// TODO move to its own file later
class MatchCreateScreenView extends StatelessWidget {
  const MatchCreateScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text(
              "Some match info  that will be wrapped in a stream of match name value"),
          Container(
            color: ColorConstants.greenDark,
            child: Column(
              children: [
                // TODO all of these need to be wrapped in their own streams for validation - will need to create some helpers for validat
                TextField(
                  decoration: InputDecoration(
                    labelText: "Match name",
                  ),
                ),
                SizedBox(
                  height: SpacingConstants.large,
                ),
                Text("location"),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Location name",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Address",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "City",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Country",
                  ),
                ),
                SizedBox(
                  height: SpacingConstants.large,
                ),
                Text("date & time"),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Select date",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Select time",
                  ),
                ),
                SizedBox(
                  height: SpacingConstants.large,
                ),
                CheckboxListTile(
                  value: true,
                  onChanged: (value) {},
                  title: Text("Join match?"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
