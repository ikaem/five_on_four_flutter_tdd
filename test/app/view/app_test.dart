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

// import 'app_test.mocks.dart';

import 'package:five_on_four_flutter_tdd/app/view/app.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/providers/fake_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../features/auth/data/data_sources/auth_local/data_source.mocks.dart';
import '../../helpers/data/auth.dart';

void main() {
  group(
    'App UI tests',
    () {
      // TODO replace this with another app
      testWidgets(
        'should render Splash Screen on app start',
        (widgetTester) async {
          final MockAuthLocalDataSource mockAuthLocalDataSource =
              MockAuthLocalDataSource();

          when(mockAuthLocalDataSource.getAuth())
              .thenAnswer((realInvocation) => Future.value(testAuthLocalDTO));

          await widgetTester.pumpWidget(
            ProviderScope(
              overrides: [
                authLocalFakeDataSourceProvider.overrideWith(
                  (ref) => mockAuthLocalDataSource,
                )
              ],
              child: App(),
            ),
          );

          // await widgetTester.pumpAndSettle();
          final splashScreenFinder = find.byKey(
            const Key(AuthKeysConstants.splashScreenScaffoldKey),
          );

          expect(splashScreenFinder, findsOneWidget);
        },
      );
    },
  );

  // group(
  //   'App functionality tests tests',
  //   () {
  //     // TODO replace this with another app
  //     testWidgets(
  //       'should render Login screen if not authenticated ',
  //       (widgetTester) async {},
  //     );

  //     testWidgets(
  //       'should render Main screen if authenticated ',
  //       (widgetTester) async {},
  //     );
  //   },
  // );
}
