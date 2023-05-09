import 'package:five_on_four_flutter_tdd/features/core/domain/enums/form_field_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class RegisterInputsValidationValue with _$RegisterInputsValidationValue {
  const factory RegisterInputsValidationValue({
    required FormFieldError? emailError,
    required FormFieldError? passwordError,
    required FormFieldError? nicknameError,
  }) = _RegisterInputsValidationValue;

  const RegisterInputsValidationValue._();

  bool get areInputsValid {
    if (emailError != null) return false;
    if (passwordError != null) return false;
    if (nicknameError != null) return false;

    return true;
  }
}
