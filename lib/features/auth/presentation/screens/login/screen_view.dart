import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/login/controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/login/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/widgets/login/login_basic_inputs.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_elevated_button.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/assets_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/extensions/build_context_extension.dart';
import 'package:five_on_four_flutter_tdd/routing/app_routes.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreenView extends ConsumerWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final LoginController loginController =
        ref.read(loginAppControllerProvider.notifier);
    final AsyncValue<void> loginValue = ref.watch(loginAppControllerProvider);
    final bool isLoading = loginValue.isLoading;

    ref.listen(loginAppControllerProvider, _loggedInListener(context));

    return Scaffold(
      key: const Key(KeysConstants.loginScreenScaffoldKey),
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(SpacingConstants.small),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  AssetsConstants.pathLogoInline,
                ),
                SizedBox(
                  height: SpacingConstants.mediumLarge,
                ),
                LoginBasicInputs(
                  onEmailChange: loginController.onEmailChange,
                  onPasswordChange: loginController.onPasswordChange,
                  emailStream: loginController.emailStream,
                  passwordStream: loginController.passwordStream,
                ),
                StreamedElevatedButton(
                  enabledStateStream: loginController.inputsValidationStream,
                  onPressed: isLoading ? null : loginController.onSubmit,
                  label: isLoading
                      ? Center(
                          child: SizedBox(
                            height: DimensionsConstants.d20,
                            width: DimensionsConstants.d20,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Text("Login"),
                ),
                SizedBox(
                  height: SpacingConstants.medium,
                ),
                TextButton(
                  onPressed: () => context
                      .pushNamed(AppRoutes.registerScreenRouteValue.name),
                  child: Text("Register?"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Function(AsyncValue<void>?, AsyncValue<void>) _loggedInListener(
    BuildContext context,
  ) =>
      (
        prevState,
        currentState,
      ) {
        currentState.when(
          data: (none) => null,
          error: (error, stackTrace) => context.showSnackBarMessage(
            "Login failed",
            SnackBarVariant.error,
          ),
          loading: () => null,
        );
      };
}
