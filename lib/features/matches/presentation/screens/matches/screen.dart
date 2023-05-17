import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/screens/matches/screen_content.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    // final AsyncValue<List<MatchModel>> matchesSearchValue =
    //     ref.watch(matchesSearchAppControllerProvider);

    return Scaffold(
      key: const Key(KeysConstants.matchesScreenScaffoldKey),
      appBar: AppBar(
        title: Text("Matches"),
      ),
      // TODO wrapping this in single child scroll view would prevent overdflow - but i dont want that
      body: MatchesScreenContent(
          // matchesSearchState: matchesSearchValue,
          // onChangeSearchTerm: ref
          //     .read(matchesSearchAppControllerProvider.notifier)
          //     .onChangeSearchTerm,
          ),
    );
  }
}
