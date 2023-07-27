import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/register/controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/register/providers/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/widgets/register/register_basic_inputs.dart';
import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_elevated_button.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/assets_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/constants/widget_keys_constants.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/extensions/build_context_extension.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreenView extends ConsumerWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final RegisterController registerController =
        ref.read(registerAppControllerProvider.notifier);
    final AsyncValue<void> registerValue =
        ref.watch(registerAppControllerProvider);
    final bool isLoading = registerValue.isLoading;

    ref.listen(registerAppControllerProvider, _registeredListener(context));

    return Scaffold(
      key: const Key(KeysConstants.registerScreenScaffoldKey),
      appBar: AppBar(title: const Text('Register')),
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
                RegisterBasicInputs(
                  onEmailChange: registerController.onEmailChange,
                  onPasswordChange: registerController.onPasswordChange,
                  onNicknameChange: registerController.onNicknameChange,
                  emailStream: registerController.emailStream,
                  passwordStream: registerController.passwordStream,
                  nicknameStream: registerController.nicknameStream,
                ),
                StreamedElevatedButton(
                  enabledStateStream: registerController.inputsValidationStream,
                  onPressed: isLoading ? null : registerController.onRegister,
                  label: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text("Register"),
                ),
                SizedBox(
                  height: SpacingConstants.medium,
                ),
                // TextButton(
                //     onPressed: () =>
                //         context.pushNamed(AppRoutes.loginScreenRouteValue.name),
                //     child: Text("Login?"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Function(AsyncValue<void>?, AsyncValue<void>) _registeredListener(
    BuildContext context,
  ) =>
      (
        prevState,
        currentState,
      ) {
        currentState.when(
          data: (none) => null,
          error: (error, stackTrace) => context.showSnackBarMessage(
            "Register failed",
            SnackBarVariant.error,
          ),
          loading: () => null,
        );
      };
}
