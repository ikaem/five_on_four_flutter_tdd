import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/screen_main_title.dart';
import 'package:flutter/material.dart';

class MatchInfoTitleOverview extends StatelessWidget {
  const MatchInfoTitleOverview({
    super.key,
    required this.title,
    required this.organizerNickname,
  });

  final String title;
  final String organizerNickname;

  @override
  Widget build(BuildContext context) {
    return ScreenMainTitle(
      primaryLeadingLabel: "Match: ",
      primaryTrailingLabel: title,
      secondaryLeadingLabel: "organized by: ",
      secondaryTrailingLabel: organizerNickname,
    );
  }
}
