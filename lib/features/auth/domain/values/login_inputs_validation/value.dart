import 'package:five_on_four_flutter_tdd/features/core/domain/enums/form_field_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class LoginInputsValidationValue with _$LoginInputsValidationValue {
  const factory LoginInputsValidationValue({
    required FormFieldError? emailError,
    required FormFieldError? passwordError,
  }) = _LoginInputsValidationValue;

  const LoginInputsValidationValue._();

  bool get areInputsValid {
    if (emailError != null) return false;
    if (passwordError != null) return false;

    return true;
  }
}
