import 'package:five_on_four_flutter_tdd/features/core/domain/enums/search_results_sort_direction.dart';
import 'package:flutter/material.dart';

class SearchSortDirectionFilter extends StatelessWidget {
  const SearchSortDirectionFilter({
    required this.labelTextStyle,
  });

  final TextStyle labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        ),
        SizedBox(
          width: 32,
          height: 32,
          child: PopupMenuButton<SearchResultsSortDirection>(
            padding: EdgeInsets.zero,
            initialValue: SearchResultsSortDirection.ascending,
            icon: Icon(Icons.arrow_drop_down),
            onSelected: (value) {},
            itemBuilder: (context) {
              return <PopupMenuEntry<SearchResultsSortDirection>>[
                PopupMenuItem<SearchResultsSortDirection>(
                  child: Text(
                    SearchResultsSortDirection.ascending.name.toUpperCase(),
                  ),
                  value: SearchResultsSortDirection.ascending,
                ),
                PopupMenuItem<SearchResultsSortDirection>(
                  child: Text(
                    SearchResultsSortDirection.descending.name.toUpperCase(),
                  ),
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
