import 'package:five_on_four_flutter_tdd/features/core/application/services/initial_data/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/controller.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/state/controllers/initial_data/providers/app_controller/provider.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/match_info/match_info_brief_overview.dart';
import 'package:five_on_four_flutter_tdd/features/matches/presentation/widgets/matches_briefs_lists_tabbled_overview.dart';
import 'package:five_on_four_flutter_tdd/features/players/presentation/widgets/widgets.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../../helpers/navigation/mock_app_router.dart';
import '../../../application/services/initial_data/app_service.mocks.dart';

void main() {
  group(
    "Teting Home Screen UI",
    () {
      testWidgets(
        "Should render Player brief info, matchInfoBriefOverview, and matchesBriefsListTabbedOverview",
        (widgetTester) async {
          // TODO this does not work at all - this mocking image thing
          await mockNetworkImagesFor(() async {
            final MockInitialDataAppService mockInitialDataAppService =
                MockInitialDataAppService();

            // when(mockInitialDataAppService._getCurrentPlayerInvitedMatches())
            //     .thenAnswer(
            //   (realInvocation) {
            //     return Future.value([]);
            //   },
            // );
            // when(mockInitialDataAppService._getCurrentPlayerJoinedMatches())
            //     .thenAnswer(
            //   (realInvocation) => Future.value([]),
            // );
            // when(mockInitialDataAppService._getCurrentPlayerNextMatch())
            //     .thenAnswer(
            //   (realInvocation) => Future.value(testMatchInfoModel),
            // );

            final List<Override> overrides = [
              initialDataServiceProvider.overrideWith(
                (ref) => mockInitialDataAppService,
              ),
            ];

            // needed to make sure same instance of provider is used inside the provider scope and here when loading data
            final ProviderContainer providerContainer = ProviderContainer(
              overrides: overrides,
            );

            final InitialDataController initialDataController =
                providerContainer
                    .read(initialDataAppControllerProvider.notifier);
            await initialDataController.onLoadInitialData();

            final MockAppRouter mockAppRouter = MockAppRouter(
              initialAppRoute: AppRoutes.homeScreenRouteValue,
              routes: [
                AppRoutes.homeRoute,

                // MockAppRouter.createGoRoute(
                //   appRouteValue: AppRoutes.homeScreenRouteValue,
                //   screen: HomeScreen(),
                // )
              ],
            );

            // mockNetworkImagesFor(() => null);

            await widgetTester.pumpApp(
              router: mockAppRouter.router,
              providerScopeOverrides: [],
              providerContainer: providerContainer,
            );

            await widgetTester.pumpAndSettle();

            final Finder playerInfoOverview = find.byType(PlayerBriefOverview);
            final Finder nextMatchInfoOverview =
                find.byType(MatchInfoBriefOverview);
            final Finder MatchesBriefsListOverview =
                find.byType(MatchesBriefsListsTabbedOverview);

            expect(playerInfoOverview, findsNWidgets(1));
            expect(nextMatchInfoOverview, findsNWidgets(1));
            expect(MatchesBriefsListOverview, findsNWidgets(1));
          });
        },
        tags: [
          "home_screen",
        ],
        // TODO unskip later
        skip: true,
      );
    },
  );

  group("Integration tests (I guess) - Testing Home Screen functionality", () {
    testWidgets("Should navigate to ", (widgetTester) async {
      final MockInitialDataAppService mockInitialDataAppService =
          MockInitialDataAppService();

      // when(mockInitialDataAppService._getCurrentPlayerInvitedMatches())
      //     .thenAnswer(
      //   (realInvocation) {
      //     return Future.value([]);
      //   },
      // );
      // when(mockInitialDataAppService._getCurrentPlayerJoinedMatches())
      //     .thenAnswer(
      //   (realInvocation) => Future.value([]),
      // );
      // when(mockInitialDataAppService._getCurrentPlayerNextMatch()).thenAnswer(
      //   (realInvocation) => Future.value(testMatchInfoModel),
      // );

      final List<Override> overrides = [
        initialDataServiceProvider.overrideWith(
          (ref) => mockInitialDataAppService,
        ),
      ];

      final ProviderContainer providerContainer = ProviderContainer(
        overrides: overrides,
      );

      final InitialDataController initialDataController =
          providerContainer.read(initialDataAppControllerProvider.notifier);
      await initialDataController.onLoadInitialData();

      final MockAppRouter mockAppRouter = MockAppRouter(
        initialAppRoute: AppRoutes.homeScreenRouteValue,
        routes: [
          AppRoutes.homeRoute,
          AppRoutes.matchInfoRoute,
        ],
      );

      await widgetTester.pumpApp(
        router: mockAppRouter.router,
        providerScopeOverrides: [],
        providerContainer: providerContainer,
      );

      await widgetTester.pumpAndSettle();

      final Finder nextMatchInfoOverview = find.byType(MatchInfoBriefOverview);

      expect(nextMatchInfoOverview, findsNWidgets(1));

      await widgetTester.tap(nextMatchInfoOverview);
      await widgetTester.pumpAndSettle();

      final Finder matchInfoScreenFinder =
          find.byKey(Key(KeysConstants.matchInfoScreenScaffoldKey));

      expect(matchInfoScreenFinder, findsOneWidget);
    });
  });
}
