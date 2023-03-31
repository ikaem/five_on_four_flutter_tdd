import 'package:five_on_four_flutter_tdd/core/routing/app_router.dart';
import 'package:five_on_four_flutter_tdd/core/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../../helpers/navigation/mock_app_router.dart';

void main() {
  print('TODO - JUST TESTING PRINTS!!');
  group('Testing Login Screen UI', () {
    testWidgets("Login Screen should have a Text Field with 'email' label",
        (widgetTester) async {
      final AppRouter mockAppRouter = MockAppRouter(
        initialAppRoute: AppRoutes.loginScreenRoute,
        routes: [
          MockAppRouter.createGoRoute(
            appRouteValue: AppRoutes.loginScreenRoute,
            screen: LoginScreen(),
          )
        ],
      );

      await widgetTester.pumpApp(
        // widget: const LoginScreen(),
        appRouter: mockAppRouter,
      );

      final emailTextFieldFinder = find.widgetWithText(TextField, 'Email');
      expect(emailTextFieldFinder, findsOneWidget);
    });

    testWidgets("Login Screen should have a Text Field with 'password' label",
        (widgetTester) async {
      final AppRouter mockAppRouter = MockAppRouter(
        initialAppRoute: AppRoutes.loginScreenRoute,
        routes: [
          MockAppRouter.createGoRoute(
            appRouteValue: AppRoutes.loginScreenRoute,
            screen: LoginScreen(),
          )
        ],
      );

      await widgetTester.pumpApp(
        // widget: const LoginScreen(),/*  */
        appRouter: mockAppRouter,
      );

      final passwordTextFieldFinder =
          find.widgetWithText(TextField, 'Password');
      expect(passwordTextFieldFinder, findsOneWidget);
    });

    testWidgets('Login Screen should have a login button',
        (widgetTester) async {
      final AppRouter mockAppRouter = MockAppRouter(
        initialAppRoute: AppRoutes.loginScreenRoute,
        routes: [
          MockAppRouter.createGoRoute(
            appRouteValue: AppRoutes.loginScreenRoute,
            screen: LoginScreen(),
          )
        ],
      );

      await widgetTester.pumpApp(
        // widget: const LoginScreen(),
        appRouter: mockAppRouter,
      );

      final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Login');
      expect(loginButtonFinder, findsOneWidget);
    });
  });

  testWidgets(
      'Login Screen should have a button that navigates to Register Screen',
      (widgetTester) async {
    final AppRouter mockAppRouter = MockAppRouter(
      initialAppRoute: AppRoutes.loginScreenRoute,
      routes: [
        MockAppRouter.createGoRoute(
          appRouteValue: AppRoutes.loginScreenRoute,
          screen: LoginScreen(),
        )
      ],
    );

    await widgetTester.pumpApp(
      // widget: const LoginScreen(),
      appRouter: mockAppRouter,
    );

    final registerButtonFinder = find.widgetWithText(TextButton, 'Register');
    expect(registerButtonFinder, findsOneWidget);
  });

  group('Testing Login Screen functionality', () {
    testWidgets(
        "Tapping on 'Register' button should navigate to RegisterScreen",
        (widgetTester) async {
      final AppRouter mockAppRouter = MockAppRouter(
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
        // widget: const LoginScreen(),
        appRouter: mockAppRouter,
      );

      final Finder registerButtonFinder =
          find.widgetWithText(TextButton, "Register");

      expect(registerButtonFinder, findsOneWidget);

      await widgetTester.tap(registerButtonFinder);

      // Wait for navigation to finish
      await widgetTester.pumpAndSettle();

      final registerScreenFinder =
          find.byKey(const Key(AuthKeysConstants.registerScreenScaffoldKey));

      expect(registerScreenFinder, findsOneWidget);
    });
  });
}
