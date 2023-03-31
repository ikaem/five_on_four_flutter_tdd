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

import 'dart:developer';

import 'package:five_on_four_flutter_tdd/app/view/app.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/data_sources/auth_local/providers/fake_data_source_provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/data/dtos/auth_local/dto.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/data_sources/matches_remote/providers/fake_data_source_provider.dart';
import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/data/auth.dart';
import '../../helpers/data/matches.dart';
import '../../helpers/data_sources/sources.mocks.dart';

// import 'app_test.mocks.dart';

void main() {
  group(
    'App tests',
    () {
      // TODO replace this with another app
      testWidgets(
        'should render Splash Screen on app start',
        (widgetTester) async {
// TODO test
          final AuthLocalDTO authLocalDTO = testAuthLocalDTO;

          final MockAuthLocalDataSource mockAuthLocalDataSource =
              MockAuthLocalDataSource();

          when(mockAuthLocalDataSource.getAuth()).thenAnswer((realInvocation) {
            return Future.value(authLocalDTO);
          });

          // await widgetTester.pumpWidget(const App()); -> this fails
          await widgetTester.pumpWidget(
            ProviderScope(
              child: const App(),
              overrides: [
                authLocalFakeDataSourceProvider
                    //     .overrideWith((ref) => MockAuthLocalDataSource()),
                    .overrideWith((ref) => mockAuthLocalDataSource),
              ],
            ),
          );

          // no need for this now when we have this mock thing i thing
          // await widgetTester.pump(Duration(seconds: 3));

          final splashScreenFinder = find.byKey(
            const Key(AuthKeysConstants.splashScreenScaffoldKey),
          );

          expect(splashScreenFinder, findsOneWidget);
        },
      );

      testWidgets(
        'should render Main Screen if authenticated',
        (widgetTester) async {
          // Create an instance of your mock AuthLocalDataSource and specify the behavior.
          final MockAuthLocalDataSource mockAuthLocalDataSource =
              MockAuthLocalDataSource();

          final MockMatchesRemoteDataSource mockMatchesRemoteDataSource =
              MockMatchesRemoteDataSource();

          final AuthLocalDTO authLocalDTO = testAuthLocalDTO;
          when(mockAuthLocalDataSource.getAuth()).thenAnswer(
            (realInvocation) {
              return Future.value(authLocalDTO);
            },
          );

          final MatchRemoteDTO matchRemoteDTO = testMatchRemoteDTO;

          when(
            mockMatchesRemoteDataSource
                .getPlayerInvitedMatches(authLocalDTO.id),
          ).thenAnswer(
            (realInvocation) => Future.value([]),
          );

          when(
            mockMatchesRemoteDataSource.getPlayerJoinedMatches(authLocalDTO.id),
          ).thenAnswer(
            (realInvocation) => Future.value([]),
          );

          when(
            mockMatchesRemoteDataSource.getPlayerNextMatch(authLocalDTO.id),
          ).thenAnswer(
            (realInvocation) {
              log("In side get match!!!!!!!!!!!!!!!");
              return Future.value(matchRemoteDTO);
            },
          );

          await widgetTester.pumpWidget(
            ProviderScope(
              child: const App(),
              overrides: [
                authLocalFakeDataSourceProvider.overrideWith(
                  (_) => mockAuthLocalDataSource,
                ),
                matchesRemoteFakeDataSourceProvider.overrideWith(
                  (_) => mockMatchesRemoteDataSource,
                ),
              ],
            ),
          );

          await widgetTester.pumpAndSettle();

          final mainScreenFinder = find.byKey(
            const Key(AuthKeysConstants.mainScreenScaffoldKey),
          );
          expect(mainScreenFinder, findsOneWidget);
        },
      );

      testWidgets(
        'should render Login Screen if not authenticated',
        (widgetTester) async {
          // Create an instance of your mock AuthLocalDataSource and specify the behavior.
          final MockAuthLocalDataSource mockAuthLocalDataSource =
              MockAuthLocalDataSource();

          final AuthLocalDTO? authLocalDTO = null;

          when(mockAuthLocalDataSource.getAuth())
              .thenAnswer((realInvocation) => Future.value(authLocalDTO));

          // Build the App widget wrapped in a ProviderScope with overrides for your mocked dependencies.
          await widgetTester.pumpWidget(
            ProviderScope(
              child: const App(),
              overrides: [
                authLocalFakeDataSourceProvider.overrideWith(
                  (_) => mockAuthLocalDataSource,
                ),
                // other dependencies if needed
              ],
            ),
          );

          // Pump the widget tree until the main screen appears.
          await widgetTester.pumpAndSettle();
          // debugDumpApp();

          final Finder loginScreenFinder = find.byKey(
            const Key(AuthKeysConstants.loginScreenScaffoldKey),
          );

          expect(loginScreenFinder, findsOneWidget);
        },
      );
    },
  );
}
