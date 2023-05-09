abstract class RegisterController {
  // form submission
  Future<void> onRegister();

  // input streams
  Stream<String> get emailStream;
  Stream<String> get passwordStream;
  Stream<String> get nicknameStream;
  Stream<bool> get inputsValidationStream;

  // input change handlers
  void onEmailChange(String value);
  void onPasswordChange(String value);
  void onNicknameChange(String value);

  void dispose();
}
