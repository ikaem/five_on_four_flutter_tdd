import 'package:five_on_four_flutter_tdd/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, [
    NavigatorObserver? mockNavigatorObserver,
  ]) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        navigatorObservers: [
          if (mockNavigatorObserver != null) mockNavigatorObserver,
        ],
        home: widget,
      ),
    );
  }
}
