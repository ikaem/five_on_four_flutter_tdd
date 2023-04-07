import 'package:five_on_four_flutter_tdd/core/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../../helpers/navigation/mock_app_router.dart';

void main() {
  group(
    "Testing Login Screen UI",
    () {
      testWidgets(
        "Login Screen should have a Text Field with email label",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.loginScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.loginScreenRoute,
                screen: LoginScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
          );

          final emailTextFieldFinder = find.widgetWithText(TextField, 'Email');
          expect(emailTextFieldFinder, findsOneWidget);
        },
      );

      testWidgets(
        "Login Screen should have a Text Field with password label",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.loginScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.loginScreenRoute,
                screen: LoginScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
          );

          final passwordTextFieldFinder =
              find.widgetWithText(TextField, 'Password');
          expect(passwordTextFieldFinder, findsOneWidget);
        },
      );

      testWidgets(
        "Login Screen should have a Login button",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.loginScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.loginScreenRoute,
                screen: LoginScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
          );

          final loginButtonFinder =
              find.widgetWithText(ElevatedButton, 'Login');
          expect(loginButtonFinder, findsOneWidget);
        },
      );

      testWidgets(
        "Login Screen should have a Register button",
        (widgetTester) async {
          final MockAppRouter mockAppRouter = MockAppRouter(
            initialAppRoute: AppRoutes.loginScreenRoute,
            routes: [
              MockAppRouter.createGoRoute(
                appRouteValue: AppRoutes.loginScreenRoute,
                screen: LoginScreen(),
              )
            ],
          );

          await widgetTester.pumpApp(
            router: mockAppRouter.router,
            providerScopeOverrides: [],
          );

          final registerButtonFinder =
              find.widgetWithText(TextButton, 'Register');

          expect(registerButtonFinder, findsOneWidget);
        },
      );
    },
  );

  group("Testing Login Screen functionality", () {
    testWidgets("Tapping on Register button should navigate to Register Screen",
        (widgetTester) async {
      final MockAppRouter mockAppRouter = MockAppRouter(
        initialAppRoute: AppRoutes.loginScreenRoute,
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
      );

      final Finder registerButtonFinder =
          find.widgetWithText(TextButton, 'Register');

      await widgetTester.tap(registerButtonFinder);

      await widgetTester.pumpAndSettle();

      final Finder registerScreenFinder =
          find.byKey(const Key(AuthKeysConstants.registerScreenScaffoldKey));

      expect(registerScreenFinder, findsOneWidget);
    });
  });
}
