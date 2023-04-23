import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/dimensions_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class MatchInviteParticipantsView extends StatelessWidget {
  const MatchInviteParticipantsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: SpacingConstants.medium),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Search players",
              labelStyle: TextStyle(color: ColorConstants.black),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorConstants.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  "Selected players",
                  style: themeText.titleSmall,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: SpacingConstants.medium,
                ),
              ),
              SliverGrid.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 32,
                  maxCrossAxisExtent: 150,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,

                  // crossAxisSpacing: ,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(
                      horizontal: SpacingConstants.medium,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstants.yellow,
                      borderRadius: BorderRadius.circular(
                        DimensionsConstants.d20,
                      ),
                    ),
                    // child: Text("Karlo"),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            "Nickname longer one ${index + 1}",
                            overflow: TextOverflow.ellipsis,
                            style: themeText.labelMedium!.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.cancel,
                            color: ColorConstants.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: SpacingConstants.medium,
                ),
              ),
              // SliverPadding(
              //   padding:
              //       EdgeInsets.symmetric(vertical: SpacingConstants.medium),
              //   sliver: SliverToBoxAdapter(
              //     child: ElevatedButton(
              //       child: Text("Add selected players"),
              //       onPressed: () {},
              //     ),
              //   ),
              // ),
              SliverToBoxAdapter(
                child: Text(
                  "Search results",
                  style: themeText.titleSmall,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: SpacingConstants.medium,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: SpacingConstants.small,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Nickname",
                            style: themeText.labelLarge,
                          ),
                          SizedBox(
                            width: SpacingConstants.medium,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.add_circle,
                              color: ColorConstants.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
