import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_enable_option_filter.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_filter_wrapper.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/search/search_sort_direction_filter.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

class SearchFiltersContainer extends StatelessWidget {
  // TODO this could accept children actually, so we can reuse it
  const SearchFiltersContainer({
    super.key,
    required this.themeText,
  });

  final TextTheme themeText;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SpacingConstants.small,
      runSpacing: SpacingConstants.small,
      children: [
        // TODO make wrapper out of this
        SearchFilterWrapper(
          child: SearchSortDirectionFilter(
            labelTextStyle: themeText.labelMedium!,
          ),
        ),
        SearchFilterWrapper(
          child: SearchEnableOptionFilter(
            labelTextStyle: themeText.labelMedium!,
          ),
        ),
        SearchFilterWrapper(
          child: SearchEnableOptionFilter(
            labelTextStyle: themeText.labelMedium!,
          ),
        ),
      ],
    );
  }
}
