// import 'dart:developer';

// import 'package:five_on_four_flutter_tdd/core/presentation/screens/main/screen.dart';
// import 'package:five_on_four_flutter_tdd/core/routing/app_router.dart';
// import 'package:five_on_four_flutter_tdd/core/routing/app_routes.dart';

// import 'package:five_on_four_flutter_tdd/features/matches/data/dtos/match_remote/dto.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../../../../../helpers/data/auth.dart';
// import '../../../../../helpers/data/matches.dart';
// import '../../../../../helpers/data_sources/sources.mocks.dart';
// import '../../../../../helpers/helpers.dart';
// import '../../../../../helpers/navigation/mock_app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "Testing Main Screen UI",
    () {
//       testWidgets(
//         "Should render spinner first time it renders",
//         (widgetTester) async {
//           final MockAppRouter mockAppRouter = MockAppRouter(
//             initialAppRoute: AppRoutes.mainScreenRoute,
//             routes: [
//               MockAppRouter.createGoRoute(
//                 appRouteValue: AppRoutes.mainScreenRoute,
//                 screen: MainScreen(),
//               )
//             ],
//           );

//           // final ProviderContainer providerContainer = ProviderContainer();
//           // providerContainer.read(authStatusAppControllerProvider);

//           // await authStatusController.

//           await widgetTester.pumpApp(
//             router: mockAppRouter.router,
//             providerScopeOverrides: [],
//           );

//           // debugDumpApp();

// // NOT NEEDED - initial state is loading anyhow
//           // await widgetTester.pumpAndSettle();

//           final Finder spinnerFinder = find.byType(CircularProgressIndicator);
//           expect(spinnerFinder, findsOneWidget);
//         },
//         tags: [
//           "main_screen",
//         ],
//       );

//       testWidgets(
//         "Should render error message if error with fetching data",
//         (widgetTester) async {
//           final MockAppRouter mockAppRouter = MockAppRouter(
//             initialAppRoute: AppRoutes.mainScreenRoute,
//             routes: [
//               MockAppRouter.createGoRoute(
//                 appRouteValue: AppRoutes.mainScreenRoute,
//                 screen: MainScreen(),
//               )
//             ],
//           );

//           // final ProviderContainer providerContainer = ProviderContainer();
//           // providerContainer.read(authStatusAppControllerProvider);

//           // await authStatusController.

//           await widgetTester.pumpApp(
//             router: mockAppRouter.router,
//             providerScopeOverrides: [],
//           );

//           // debugDumpApp();

// // NOT NEEDED - initial state is loading anyhow
//           await widgetTester.pumpAndSettle();

//           // final Finder errorTextFinder = find.widgetWithText(
//           //     Text, "There was an error fetching initial data");

//           // final Finder errorTextFinder = find.byType(Text);
//           final Finder errorTextFinder = find.byWidgetPredicate((widget) {
//             final bool isMatch = widget is Text &&
//                 widget.data == "There was an error fetching initial data";

//             return isMatch;
//           });

//           // TODO test
//           expect(errorTextFinder, findsOneWidget);
//         },
//         tags: [
//           "main_screen",
//         ],
//       );

      testWidgets(
        "Should render data message if successfully fetching data",
        (widgetTester) async {
          // final Mockauthstat mockAuthLocalDataSource =
          //     MockAuthLocalDataSource();

// TODO potentually, this can go up
          // final MockAuthStatusAppRepository mockAuthStatusAppRepository =
          //     MockAuthStatusAppRepository();

          // when(mockAuthStatusAppRepository.getAuthStatus())
          //     .thenAnswer((realInvocation) => Future.value(testAuthModel));

          // final MockAppRouter mockAppRouter = MockAppRouter(
          //   initialAppRoute: AppRoutes.mainScreenRouteValue,
          //   routes: [
          //     AppRoutes.mainRoute,

          //     // MockAppRouter.createGoRoute(
          //     //   appRouteValue: AppRoutes.mainScreenRouteValue,
          //     //   screen: MainScreen(),
          //     // )
          //   ],
          // );

          // final ProviderContainer providerContainer = ProviderContainer();
          // providerContainer.read(authStatusAppControllerProvider);

          // TODO test only
          // await Future<void>.delayed(Duration(milliseconds: 1));

          // await authStatusController.

          // await widgetTester.pumpApp(
          //   router: mockAppRouter.router,
          //   // providerScopeOverrides: [],
          //   providerScopeOverrides: [
          //     authStatusRepositoryProvider.overrideWith(
          //       (ref) => mockAuthStatusAppRepository,
          //     )
          //   ],
          //   providerContainer: null,
          // );

          // debugDumpApp();

// NOT NEEDED - initial state is loading anyhow
          await widgetTester.pumpAndSettle();

          // final Finder errorTextFinder = find.widgetWithText(
          //     Text, "There was an error fetching initial data");

          // final Finder errorTextFinder = find.byType(Text);
          debugDumpApp();
          final Finder dataContentFinder = find.byWidgetPredicate((widget) {
            final bool isMatch =
                // widget is Text && widget.data == "Some data has loaded";
                widget is SizedBox;

            return isMatch;
          });

          // TODO test
          expect(dataContentFinder, findsOneWidget);
        },
        tags: [
          "main_screen",
        ],
        // TODO skip for now until know what to return from main screen when data loads - probably just sized box shrink
        // TODO this test will fail iimmediately because we immediately redirect ot other page
        skip: true,
      );
    },
  );
}

// void main() {
//   // TODO WOULD like to create a function out of this
//   // Create an instance of your mock AuthLocalDataSource and specify the behavior.
//   final MockAuthLocalDataSource mockAuthLocalDataSource =
//       MockAuthLocalDataSource();

//   final MockMatchesRemoteDataSource mockMatchesRemoteDataSource =
//       MockMatchesRemoteDataSource();

//   final AuthLocalDTO authLocalDTO = testAuthLocalDTO;
//   when(mockAuthLocalDataSource.getAuth()).thenAnswer(
//     (realInvocation) {
//       return Future.value(authLocalDTO);
//     },
//   );

//   final MatchRemoteDTO matchRemoteDTO = testMatchRemoteDTO;

//   when(
//     mockMatchesRemoteDataSource.getPlayerInvitedMatches(authLocalDTO.id),
//   ).thenAnswer(
//     (realInvocation) => Future.value([]),
//   );

//   when(
//     mockMatchesRemoteDataSource.getPlayerJoinedMatches(authLocalDTO.id),
//   ).thenAnswer(
//     (realInvocation) => Future.value([]),
//   );

//   when(
//     mockMatchesRemoteDataSource.getPlayerNextMatch(authLocalDTO.id),
//   ).thenAnswer(
//     (realInvocation) {
//       log("In side get match!!!!!!!!!!!!!!!");
//       return Future.value(matchRemoteDTO);
//     },
//   );
//   group("Testing Main Screen UI", () {
//     testWidgets(
//         "Main Screen should render a spinner when it renders first time",
//         (widgetTester) async {
//       final AppRouter mockAppRouter = MockAppRouter(
//         initialAppRoute: AppRoutes.loginScreenRoute,
//         routes: [
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.loginScreenRoute,
//             screen: MainScreen(),
//           )
//         ],
//       );

//       await widgetTester
//           .pumpApp(appRouter: mockAppRouter, providerScopeOverrides: [
//         authLocalFakeDataSourceProvider.overrideWith(
//           (_) => mockAuthLocalDataSource,
//         ),
//         matchesRemoteFakeDataSourceProvider.overrideWith(
//           (_) => mockMatchesRemoteDataSource,
//         ),
//       ]);

//       await widgetTester.pumpAndSettle();
//       debugDumpApp();

//       final Finder spinnerFinder = find.byType(Text);

//       expect(spinnerFinder, findsOneWidget);
//     });
//   });
// }
