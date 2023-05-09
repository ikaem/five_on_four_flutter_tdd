import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/register_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/values/register_inputs_validation/value.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/register/controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/mixins/mixins.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

@riverpod
class RegisterAppController extends _$RegisterAppController
    with ValidationMixin, AuthValidationMixin
    implements RegisterController {
  late final AuthService _authService = ref.read(authServiceProvider);

  @override
  AsyncValue<void> build() {
    _initializeController();

    return AsyncValue.data(null);
  }

  @override
  void dispose() {
    ref.onDispose(() async {
      await _emailSubject.close();
      await _passwordSubject.close();
      await _nicknameSubject.close();
    });
  }

  @override
  Stream<String> get emailStream =>
      _emailStream.transform(emailValidationTransformer);
  @override
  Stream<String> get passwordStream =>
      _passwordStream.transform(passwordValidationTransformer);
  @override
  Stream<String> get nicknameStream =>
      _nicknameStream.transform(genericTextValidationTransformer);

  @override
  Stream<bool> get inputsValidationStream =>
      Rx.combineLatest3<String, String, String, bool>(
        _emailStream,
        _passwordStream,
        _nicknameStream,
        registerInputValuesValidator,
      );

  @override
  void onEmailChange(String value) {
    _emailSink.add(value);
  }

  @override
  void onPasswordChange(String value) {
    _passwordSink.add(value);
  }

  @override
  void onNicknameChange(String value) {
    _nicknameSink.add(value);
  }

  @override
  Future<void> onRegister() async {
    final RegisterInputsValidationValue validationValue =
        validateRegisterInputs(
      emailValue: _emailSubject.valueOrNull,
      passwordValue: _passwordSubject.valueOrNull,
      nicknameValue: _nicknameSubject.valueOrNull,
    );

    if (!validationValue.areInputsValid) {
      _populateInvalidInputErrors(validationValue);
      return;
    }

    state = AsyncValue.loading();

    try {
      final RegisterCredentialsArgs args = RegisterCredentialsArgs(
        email: _emailSubject.value,
        password: _passwordSubject.value,
        nickname: _nicknameSubject.value,
      );

      await _authService.register(args);

      state = AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void _initializeController() {
    dispose();
  }

  void _populateInvalidInputErrors(
    RegisterInputsValidationValue validationValue,
  ) {
    if (validationValue.emailError != null)
      _emailSink.addError(validationValue.emailError!);
    if (validationValue.passwordError != null)
      _passwordSink.addError(validationValue.passwordError!);
    if (validationValue.nicknameError != null)
      _nicknameSink.addError(validationValue.nicknameError!);
  }

  final BehaviorSubject<String> _emailSubject = BehaviorSubject();
  final BehaviorSubject<String> _passwordSubject = BehaviorSubject<String>();
  final BehaviorSubject<String> _nicknameSubject = BehaviorSubject<String>();

  StreamSink<String> get _emailSink => _emailSubject.sink;
  StreamSink<String> get _passwordSink => _passwordSubject.sink;
  StreamSink<String> get _nicknameSink => _nicknameSubject.sink;

  Stream<String> get _emailStream => _emailSubject.distinct();
  Stream<String> get _passwordStream => _passwordSubject.distinct();
  Stream<String> get _nicknameStream => _nicknameSubject.distinct();

  // TODO move to mixin
}
