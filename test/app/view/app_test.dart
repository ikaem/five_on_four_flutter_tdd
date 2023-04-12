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

import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/providers/fake_data_source/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/screens/splash/screen.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../features/auth/data/data_sources/auth_local/data_source.mocks.dart';
import '../../helpers/data/auth.dart';
import '../../helpers/helpers.dart';
import '../../helpers/navigation/mock_app_router.dart';

void main() {
  final MockAuthLocalDataSource mockAuthLocalDataSource =
      MockAuthLocalDataSource();
  group(
    'App UI tests',
    () {
      testWidgets(
        'should render Splash Screen on app start',
        (widgetTester) async {
          when(mockAuthLocalDataSource.getAuth())
              .thenAnswer((realInvocation) => Future.value(testAuthLocalDTO));

          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.splashScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.splashScreenRoute,
                screen: SplashScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [
              authLocalFakeDataSourceProvider.overrideWith(
                (ref) => mockAuthLocalDataSource,
              )
            ],
            providerContainer: null,
          );

          // await widgetTester.pumpAndSettle();
          final splashScreenFinder = find.byKey(
            const Key(WidgetKeysConstants.splashScreenScaffoldKey),
          );

          expect(splashScreenFinder, findsOneWidget);
        },
      );
    },
  );

  // group(
  // TODO here will probably need to use the real app router later if i want to test taht  - these should be some integration tests
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
