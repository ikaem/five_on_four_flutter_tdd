import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/auth/domain/values/login_inputs_validation/value.dart';
import 'package:five_on_four_flutter_tdd/features/auth/domain/values/register_inputs_validation/value.dart';
import 'package:five_on_four_flutter_tdd/features/core/domain/enums/form_field_error.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';

mixin AuthValidationMixin on ValidationMixin {
  bool loginInputValuesValidator(String? email, String? password) {
    final LoginInputsValidationValue validationValue = validateLoginInputs(
      emailValue: email,
      passwordValue: password,
    );

    return validationValue.areInputsValid;
  }

  bool registerInputValuesValidator(
    String? email,
    String? password,
    String? nickname,
  ) {
    final RegisterInputsValidationValue validationValue =
        validateRegisterInputs(
      emailValue: email,
      passwordValue: password,
      nicknameValue: nickname,
    );

    return validationValue.areInputsValid;
  }

  late StreamTransformer<String, String> emailValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validateEmail(data);

      if (error != null) {
        sink.addError(error);
        return;
      }

      sink.add(data);
    },
    handleError: (error, stackTrace, sink) {
      sink.addError(FormFieldError.invalid);
    },
  );

  // TODO this could be moved to validaton mixin as well, as is reused
  late StreamTransformer<String, String> genericTextValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validateGenericText(data);

      if (error != null) {
        sink.addError(error);
        return;
      }

      sink.add(data);
    },
    handleError: (error, stackTrace, sink) {
      sink.addError(FormFieldError.invalid);
    },
  );

  late StreamTransformer<String, String> passwordValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validatePassword(data);

      if (error != null) {
        sink.addError(error);
        return;
      }

      sink.add(data);
    },
    handleError: (error, stackTrace, sink) {
      sink.addError(FormFieldError.invalid);
    },
  );

  FormFieldError? _validateEmail(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldEmail(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validatePassword(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValidPassword(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  // TODO this should probably be in general validation mixin
  FormFieldError? _validateGenericText(String? value) {
    final bool isEmpty = isFieldEmpty(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    }

    return error;
  }

  LoginInputsValidationValue validateLoginInputs({
    required String? emailValue,
    required String? passwordValue,
  }) {
    final FormFieldError? emailError = _validateEmail(emailValue!);
    final FormFieldError? passwordError = _validatePassword(passwordValue!);

    final LoginInputsValidationValue validationValue =
        LoginInputsValidationValue(
      emailError: emailError,
      passwordError: passwordError,
    );

    return validationValue;
  }

  RegisterInputsValidationValue validateRegisterInputs({
    required String? emailValue,
    required String? passwordValue,
    required String? nicknameValue,
  }) {
    final FormFieldError? emailError = _validateEmail(emailValue!);
    final FormFieldError? passwordError = _validatePassword(passwordValue!);
    final FormFieldError? nicknameError = _validateGenericText(passwordValue);

    final RegisterInputsValidationValue validationValue =
        RegisterInputsValidationValue(
      emailError: emailError,
      passwordError: passwordError,
      nicknameError: nicknameError,
    );

    return validationValue;
  }
}
