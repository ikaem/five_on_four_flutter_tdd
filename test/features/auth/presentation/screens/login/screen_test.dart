import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';
import '../../../../../helpers/mock_navigator_observer.dart';

void main() {
  print('TODO - JUST TESTING PRINTS!!');
  group('Testing Login Screen UI', () {
    testWidgets("Login Screen should have a Text Field with 'email' label",
        (widgetTester) async {
      await widgetTester.pumpApp(const LoginScreen());

      final emailTextFieldFinder = find.widgetWithText(TextField, 'Email');
      expect(emailTextFieldFinder, findsOneWidget);
    });

    testWidgets("Login Screen should have a Text Field with 'password' label",
        (widgetTester) async {
      await widgetTester.pumpApp(const LoginScreen());

      final passwordTextFieldFinder =
          find.widgetWithText(TextField, 'Password');
      expect(passwordTextFieldFinder, findsOneWidget);
    });

    testWidgets('Login Screen should have a login button',
        (widgetTester) async {
      await widgetTester.pumpApp(const LoginScreen());

      final loginButtonFinder = find.widgetWithText(ElevatedButton, 'Login');
      expect(loginButtonFinder, findsOneWidget);
    });
  });

  testWidgets(
      'Login Screen should have a button that navigates to Register Screen',
      (widgetTester) async {
    await widgetTester.pumpApp(const LoginScreen());

    final registerButtonFinder = find.widgetWithText(TextButton, 'Register');
    expect(registerButtonFinder, findsOneWidget);
  });

  group('Testing Login Screen functionality', () {
    testWidgets(
        "Tapping on 'Register' button should navigate to RegisterScreen",
        (widgetTester) async {
      final MockNavigatorObserver mockNavigatorObserver =
          MockNavigatorObserver();

      await widgetTester.pumpApp(
        const LoginScreen(),
        mockNavigatorObserver,
      );

      final Finder registerButtonFinder =
          find.widgetWithText(TextButton, "Register");

      expect(registerButtonFinder, findsOneWidget);

      await widgetTester.tap(registerButtonFinder);
      await widgetTester.pumpAndSettle();

      final registerScreenFinder =
          find.byKey(const Key(AuthKeysConstants.registerScreenScaffoldKey));

      expect(registerScreenFinder, findsOneWidget);
    });
  });
}
