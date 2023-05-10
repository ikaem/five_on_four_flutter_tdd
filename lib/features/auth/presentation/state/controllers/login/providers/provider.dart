import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/providers/app_service/provider.dart';
import 'package:five_on_four_flutter_tdd/features/auth/application/services/auth/service.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/args/login_credentials/args.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/values/login_inputs_validation/value.dart';
import 'package:five_on_four_flutter_tdd/features/auth/presentation/state/controllers/login/controller.dart';
import 'package:five_on_four_flutter_tdd/features/auth/utils/mixins/mixins.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part "provider.g.dart";

@riverpod
class LoginAppController extends _$LoginAppController
    with ValidationMixin, AuthValidationMixin
    implements LoginController {
  late final AuthService _authService = ref.read(authServiceProvider);

  @override
  AsyncValue<void> build() {
    _initializeController();

// TODO not sure if null is ok here
    return AsyncValue.data(null);
  }

  @override
  void dispose() {
    ref.onDispose(() async {
      await _emailSubject.close();
      await _passwordSubject.close();
    });
  }

  @override
  Stream<String> get emailStream =>
      _emailStream.transform(emailValidationTransformer);
  @override
  Stream<String> get passwordStream =>
      _passwordStream.transform(passwordValidationTransformer);

  @override
  Stream<bool> get inputsValidationStream =>
      Rx.combineLatest2<String, String, bool>(
        _emailStream,
        _passwordStream,
        loginInputValuesValidator,
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
  Future<void> onSubmit() async {
    final LoginInputsValidationValue validationValue = validateLoginInputs(
      emailValue: _emailSubject.valueOrNull,
      passwordValue: _passwordSubject.valueOrNull,
    );

    if (!validationValue.areInputsValid) {
      _populateInvalidInputErrors(validationValue);
      return;
    }

    state = AsyncValue.loading();

    try {
      final LoginCredentialsArgs args = LoginCredentialsArgs(
          email: _emailSubject.value, password: _passwordSubject.value);

      await _authService.login(args);

      state = AsyncValue.data(null);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void _initializeController() {
    dispose();
  }

  void _populateInvalidInputErrors(
    LoginInputsValidationValue validationValue,
  ) {
    if (validationValue.emailError != null)
      _emailSink.addError(validationValue.emailError!);
    if (validationValue.passwordError != null)
      _passwordSink.addError(validationValue.passwordError!);
  }

  final BehaviorSubject<String> _emailSubject = BehaviorSubject();
  final BehaviorSubject<String> _passwordSubject = BehaviorSubject<String>();

  StreamSink<String> get _emailSink => _emailSubject.sink;
  StreamSink<String> get _passwordSink => _passwordSubject.sink;

  Stream<String> get _emailStream => _emailSubject.distinct();
  Stream<String> get _passwordStream => _passwordSubject.distinct();

  // TODO move to mixin
}
