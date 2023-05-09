import 'package:five_on_four_flutter_tdd/features/core/presentation/widgets/inputs/streamed_text_field.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/color_constants.dart';
import 'package:five_on_four_flutter_tdd/theme/constants/constants.dart';
import 'package:flutter/material.dart';

class RegisterBasicInputs extends StatefulWidget {
  const RegisterBasicInputs({
    super.key,
    required this.onEmailChange,
    required this.onPasswordChange,
    required this.onNicknameChange,
    required this.emailStream,
    required this.passwordStream,
    required this.nicknameStream,
  });

  final ValueSetter<String> onEmailChange;
  final ValueSetter<String> onPasswordChange;
  final ValueSetter<String> onNicknameChange;
  final Stream<String> emailStream;
  final Stream<String> passwordStream;
  final Stream<String> nicknameStream;

  @override
  State<RegisterBasicInputs> createState() => _RegisterBasicInputsState();
}

class _RegisterBasicInputsState extends State<RegisterBasicInputs> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  @override
  void dispose() {
    _disposeWidget();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SpacingConstants.medium),
      decoration: BoxDecoration(
        color: ColorConstants.greenDark,
        borderRadius: BorderRadius.circular(DimensionsConstants.d10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamedTextField(
            inputType: TextInputType.emailAddress,
            fieldController: _emailController,
            stream: widget.emailStream,
            onChanged: widget.onEmailChange,
            labelText: "Email",
          ),
          SizedBox(
            height: SpacingConstants.xxLarge,
          ),
          StreamedTextField(
            hidden: true,
            fieldController: _passwordController,
            stream: widget.passwordStream,
            onChanged: widget.onPasswordChange,
            labelText: "Password",
          ),
          SizedBox(
            height: SpacingConstants.xxLarge,
          ),
          StreamedTextField(
            fieldController: _nicknameController,
            stream: widget.nicknameStream,
            onChanged: widget.onNicknameChange,
            labelText: "Nickname",
          ),
          SizedBox(
            height: SpacingConstants.xxLarge,
          ),
        ],
      ),
    );
  }

  void _disposeWidget() {
    _emailController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
  }
}
