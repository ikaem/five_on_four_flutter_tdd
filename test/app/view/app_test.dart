// import 'package:five_on_four_flutter_tdd/app/app.dart';
// import 'package:five_on_four_flutter_tdd/counter/counter.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('App', () {
//     testWidgets('renders CounterPage', (tester) async {
//       await tester.pumpWidget(const App());
//       expect(find.byType(CounterPage), findsOneWidget);
//     });
//   });
// }

import 'package:five_on_four_flutter_tdd/app/view/app.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'App tests',
    () {
      testWidgets(
        'should render Login Screen on app start',
        (widgetTester) async {
          await widgetTester.pumpWidget(const App());

          final loginScreenFinder = find.byKey(
            const Key(AuthKeysConstants.loginScreenScaffoldKey),
          );

          expect(loginScreenFinder, findsOneWidget);
        },
      );
    },
  );
}
