import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/spacing_constants.dart';
import 'package:flutter/material.dart';

abstract class DialogOpener {
  static Future<T?> contentDialog<T>({
    required BuildContext context,
    required Widget content,
    required String title,
  }) async {
    final T? result = await showDialog<T>(
      context: context,
      builder: (context) {
        final ThemeData theme = Theme.of(context);
        final TextTheme themeText = theme.textTheme;

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(SpacingConstants.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: themeText.titleMedium,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.cancel,
                        color: ColorConstants.black,
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: content,
                  // child: MatchInviteParticipantsView(),
                  // child: Center(child: Text("Hello")),
                ),
              ],
            ),
          ),
        );
      },
    );

    return result;
  }
}
