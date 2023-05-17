import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_enable_option_filter.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_filter_wrapper.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_sort_direction_filter.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class SearchFiltersContainer extends StatelessWidget {
  // TODO this could accept children actually, so we can reuse it
  const SearchFiltersContainer({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SpacingConstants.small,
      runSpacing: SpacingConstants.small,
      children: [
        SearchFilterWrapper(
          child: SearchSortDirectionFilter(
            labelTextStyle: textTheme.labelMedium!,
          ),
        ),
        SearchFilterWrapper(
          child: SearchEnableOptionFilter(
            labelTextStyle: textTheme.labelMedium!,
          ),
        ),
        SearchFilterWrapper(
          child: SearchEnableOptionFilter(
            labelTextStyle: textTheme.labelMedium!,
          ),
        ),
      ],
    );
  }
}
