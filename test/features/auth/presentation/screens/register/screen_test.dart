// import 'package:five_on_four_flutter_tdd/core/routing/app_router.dart';
// import 'package:five_on_four_flutter_tdd/core/routing/app_routes.dart';
// import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/login/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/auth/presentation/screens/register/screen.dart';
// import 'package:five_on_four_flutter_tdd/features/auth/utils/constants/auth_keys_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import '../../../../../helpers/navigation/mock_app_router.dart';
// import '../../../../../helpers/pump_app.dart';

void main() {}


// void main() {
//   group('Testing Register Screen UI', () {
//     testWidgets("Register Screen should have a Text Field with 'email' label",
//         (widgetTester) async {
//       final AppRouter mockAppRouter = MockAppRouter(
//         initialAppRoute: AppRoutes.loginScreenRoute,
//         routes: [
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.loginScreenRoute,
//             screen: RegisterScreen(),
//           )
//         ],
//       );

//       await widgetTester.pumpApp(
//         // widget: const RegisterScreen(),
//         appRouter: mockAppRouter,
//       );

//       final emailTextFieldFinder = find.widgetWithText(TextField, 'Email');
//       expect(emailTextFieldFinder, findsOneWidget);
//     });

//     testWidgets(
//         "Register Screen should have a Text Field with 'password' label",
//         (widgetTester) async {
//       final AppRouter mockAppRouter = MockAppRouter(
//         initialAppRoute: AppRoutes.loginScreenRoute,
//         routes: [
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.loginScreenRoute,
//             screen: RegisterScreen(),
//           )
//         ],
//       );

//       await widgetTester.pumpApp(
//         // widget: const RegisterScreen(),
//         appRouter: mockAppRouter,
//       );

//       final passwordTextFieldFinder =
//           find.widgetWithText(TextField, 'Password');
//       expect(passwordTextFieldFinder, findsOneWidget);
//     });

//     testWidgets(
//         "Register Screen should have a Text Field with 'nickname' label",
//         (widgetTester) async {
//       final AppRouter mockAppRouter = MockAppRouter(
//         initialAppRoute: AppRoutes.loginScreenRoute,
//         routes: [
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.loginScreenRoute,
//             screen: RegisterScreen(),
//           )
//         ],
//       );

//       await widgetTester.pumpApp(
//         // widget: const RegisterScreen(),
//         appRouter: mockAppRouter,
//       );

//       final nicknameTextFieldFinder =
//           find.widgetWithText(TextField, 'Nickname');
//       expect(nicknameTextFieldFinder, findsOneWidget);
//     });

//     testWidgets('Register Screen should have a register button',
//         (widgetTester) async {
//       final AppRouter mockAppRouter = MockAppRouter(
//         initialAppRoute: AppRoutes.loginScreenRoute,
//         routes: [
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.loginScreenRoute,
//             screen: RegisterScreen(),
//           )
//         ],
//       );

//       await widgetTester.pumpApp(
//         // widget: const RegisterScreen(),
//         appRouter: mockAppRouter,
//       );

//       final registerButtonFinder =
//           find.widgetWithText(ElevatedButton, 'Register');
//       expect(registerButtonFinder, findsOneWidget);
//     });

//     testWidgets(
//         'Register Screen should have a button that navigates to Login Screen',
//         (widgetTester) async {
//       final AppRouter mockAppRouter = MockAppRouter(
//         initialAppRoute: AppRoutes.loginScreenRoute,
//         routes: [
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.loginScreenRoute,
//             screen: RegisterScreen(),
//           )
//         ],
//       );

//       await widgetTester.pumpApp(
//         // widget: const RegisterScreen(),
//         appRouter: mockAppRouter,
//       );

//       final loginButtonFinder = find.widgetWithText(TextButton, 'Login');
//       expect(loginButtonFinder, findsOneWidget);
//     });
//   });

//   group('Testing Register Screen functionality', () {
//     testWidgets("Tapping on 'Login' button should navigate to LoginScreen",
//         (widgetTester) async {
//       // final MockNavigatorObserver mockNavigatorObserver =
//       //     MockNavigatorObserver();

//       // await widgetTester.pumpApp(
//       //   const RegisterScreen(),
//       //   mockNavigatorObserver,
//       // );

//       final AppRouter mockAppRouter = MockAppRouter(
//         initialAppRoute: AppRoutes.registerScreenRoute,
//         routes: [
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.loginScreenRoute,
//             screen: LoginScreen(),
//           ),
//           MockAppRouter.createGoRoute(
//             appRouteValue: AppRoutes.registerScreenRoute,
//             screen: RegisterScreen(),
//           ),
//         ],
//       );

//       await widgetTester.pumpApp(
//         // widget: const RegisterScreen(),
//         appRouter: mockAppRouter,
//       );

//       final Finder loginButtonFinder = find.widgetWithText(TextButton, "Login");

//       expect(loginButtonFinder, findsOneWidget);

//       await widgetTester.tap(loginButtonFinder);
//       await widgetTester.pumpAndSettle();

//       final loginScreenFinder =
//           find.byKey(const Key(AuthKeysConstants.loginScreenScaffoldKey));

//       expect(loginScreenFinder, findsOneWidget);
//     });
//   });
// }
