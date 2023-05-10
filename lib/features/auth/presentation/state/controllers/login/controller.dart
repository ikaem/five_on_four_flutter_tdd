abstract class LoginController {
  // form submission
  Future<void> onSubmit();

  // input streams
  Stream<String> get emailStream;
  Stream<String> get passwordStream;
  Stream<bool> get inputsValidationStream;

  // input change handlers
  void onEmailChange(String value);
  void onPasswordChange(String value);

  void dispose();
}
