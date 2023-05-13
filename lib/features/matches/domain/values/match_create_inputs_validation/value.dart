import 'package:five_on_four_flutter_tdd/features/core/domain/enums/form_field_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "value.freezed.dart";

@freezed
class MatchCreateInputsValidationValue with _$MatchCreateInputsValidationValue {
  const factory MatchCreateInputsValidationValue({
    required FormFieldError? nameError,
    required FormFieldError? locationNameError,
    required FormFieldError? locationAddressError,
    required FormFieldError? locationCityError,
    required FormFieldError? locationCountryError,
    required FormFieldError? dateError,
    required FormFieldError? timeError,
  }) = _MatchCreateInputsValidationValue;

  const MatchCreateInputsValidationValue._();

  bool get areInputsValid {
    if (nameError != null) return false;
    if (locationNameError != null) return false;
    if (locationAddressError != null) return false;
    if (locationCityError != null) return false;
    if (locationCountryError != null) return false;
    if (dateError != null) return false;
    if (timeError != null) return false;

    return true;
  }
}
