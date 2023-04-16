import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_screen_view_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchInfoScreenView extends StatelessWidget {
  const MatchInfoScreenView({
    super.key,
    required this.matchInfoState,
  });

  final AsyncValue<MatchInfoModel?> matchInfoState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key(WidgetKeysConstants.matchInfoScreenScaffoldKey),
      appBar: AppBar(),
      body: matchInfoState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return Center(
            child: Text("There was an error retrieving the match"),
          );
        },
        data: (matchInfo) => MatchInfoScreenViewContent(matchInfo: matchInfo),
      ),
    );
  }
}
