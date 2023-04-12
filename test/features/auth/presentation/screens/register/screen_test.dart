import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../../helpers/navigation/mock_app_router.dart';

void main() {
  group(
    "Testing Register Screen UI",
    () {
      testWidgets(
        "Register Screen should have a Text Field with email label",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.registerScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.registerScreenRoute,
                screen: RegisterScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
            providerContainer: null,
          );

          final emailTextFieldFinder = find.widgetWithText(TextField, 'Email');
          expect(emailTextFieldFinder, findsOneWidget);
        },
      );

      testWidgets(
        "Register Screen should have a Text Field with password label",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.registerScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.registerScreenRoute,
                screen: RegisterScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
            providerContainer: null,
          );

          final passwordTextFieldFinder =
              find.widgetWithText(TextField, 'Password');
          expect(passwordTextFieldFinder, findsOneWidget);
        },
      );

      testWidgets(
        "Register Screen should have a Text Field with nickname label",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.registerScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.registerScreenRoute,
                screen: RegisterScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
            providerContainer: null,
          );

          final passwordTextFieldFinder =
              find.widgetWithText(TextField, 'Nickname');
          expect(passwordTextFieldFinder, findsOneWidget);
        },
      );

      testWidgets(
        "Register Screen should have a Register button",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.registerScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.registerScreenRoute,
                screen: RegisterScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
            providerContainer: null,
          );

          final loginButtonFinder =
              find.widgetWithText(ElevatedButton, 'Register');
          expect(loginButtonFinder, findsOneWidget);
        },
      );

      testWidgets(
        "Register Screen should have a Login button",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.registerScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.registerScreenRoute,
                screen: RegisterScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
            providerContainer: null,
          );

          final registerButtonFinder = find.widgetWithText(TextButton, 'Login');

          expect(registerButtonFinder, findsOneWidget);
        },
      );
    },
  );

  group("Testing Register Screen functionality", () {
    testWidgets("Tapping on Login button should navigate to Login Screen",
        (widgetTester) async {
      final MockAppRouter mockAppRouter = MockAppRouter(
        initialAppRoute: AppRoutes.registerScreenRoute,
        routes: [
          MockAppRouter.createGoRoute(
            appRouteValue: AppRoutes.loginScreenRoute,
            screen: LoginScreen(),
          ),
          MockAppRouter.createGoRoute(
            appRouteValue: AppRoutes.registerScreenRoute,
            screen: RegisterScreen(),
          ),
        ],
      );

      await widgetTester.pumpApp(
        router: mockAppRouter.router,
        providerScopeOverrides: [],
        providerContainer: null,
      );

      final Finder registerButtonFinder =
          find.widgetWithText(TextButton, 'Login');

      await widgetTester.tap(registerButtonFinder);

      await widgetTester.pumpAndSettle();

      final Finder loginScreenFinder =
          find.byKey(const Key(WidgetKeysConstants.loginScreenScaffoldKey));

      expect(loginScreenFinder, findsOneWidget);
    });
  });
}
