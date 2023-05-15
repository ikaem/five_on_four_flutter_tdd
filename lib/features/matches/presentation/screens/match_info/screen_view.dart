import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/extensions/build_context_extension.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/models/match_info/model.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/state/controllers/match_join/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info_screen_view_content.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchInfoScreenView extends ConsumerWidget {
  MatchInfoScreenView({
    super.key,
    required this.matchInfo,
    required this.onReloadMatch,
  });

  final MatchInfoModel matchInfo;
  final VoidCallback onReloadMatch;

  late final MatchJoinAppControllerProvider controllerProvider =
      matchJoinAppControllerProvider(
    match: matchInfo.match,
    onMatchJoinAction: onReloadMatch,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MatchJoinAppController controller =
        ref.read(controllerProvider.notifier);

    ref.listen(
      controllerProvider,
      _participationControllerListener(context),
    );

    final bool hasPlayerJoinedMatch = controller.hasCurrentPlayerJoinedMatch;

    final ThemeData theme = Theme.of(context);
    final TextTheme themeText = theme.textTheme;

    return Scaffold(
      key: Key(KeysConstants.matchInfoScreenScaffoldKey),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              controller.onToggleMatchParticipation();
            },
            child: Text(
              hasPlayerJoinedMatch ? "UNJOIN" : "JOIN",
              style:
                  themeText.labelLarge!.copyWith(color: ColorConstants.black),
            ),
          )
        ],
      ),
      body: MatchInfoScreenViewContent(matchInfo: matchInfo),
    );
  }

  void Function(
    AsyncValue<void>? previous,
    AsyncValue<void> next,
  ) _participationControllerListener(
    BuildContext context,
  ) =>
      (
        previous,
        next,
      ) {
        next.maybeWhen(
          orElse: () => null,
          error: (error, stackTrace) => context.showSnackBarMessage(
            "There was an error updaing match participation",
            SnackBarVariant.error,
          ),
        );
      };
}
