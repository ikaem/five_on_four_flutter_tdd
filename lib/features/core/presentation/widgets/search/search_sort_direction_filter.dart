// TODO moveelsehwere
import 'package:five_on_four_flutter_tdd/features/core/domain/enums/search_results_sort_direction.dart';
import 'package:flutter/material.dart';

class SearchSortDirectionFilter extends StatelessWidget {
  const SearchSortDirectionFilter({
    required this.labelTextStyle,
  });

  final TextStyle labelTextStyle;
  // TODO there will be some fields

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    // final TextTheme themeText = theme.textTheme;

    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(
        //   width: SpacingConstants.small,
        // ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "Sort by: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                text: SearchResultsSortDirection.ascending.name.toUpperCase(),
              ),
            ],
          ),
          style: labelTextStyle,
          // TextSpan(text: "Ascending"),
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: PopupMenuButton<SearchResultsSortDirection>(
            padding: EdgeInsets.zero,
            initialValue: SearchResultsSortDirection.ascending,
            icon: Icon(Icons.arrow_drop_down),
            onSelected: (value) {
              // TODO this will set some value in the cubit that controls this i guess
            },
            itemBuilder: (context) {
              return <PopupMenuEntry<SearchResultsSortDirection>>[
                PopupMenuItem<SearchResultsSortDirection>(
                  child: Text("Ascending"),
                  value: SearchResultsSortDirection.ascending,
                ),
                PopupMenuItem<SearchResultsSortDirection>(
                  child: Text("Descending"),
                  value: SearchResultsSortDirection.descending,
                ),
              ];
            },
          ),
        ),
      ],
    );
  }
}
