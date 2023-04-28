import 'package:five_on_four_flutter_tdd/features/core/utils/constants/reg_exp_constants.dart';

typedef FieldValidator<T> = bool Function(T value);

mixin ValidationMixin {
  bool isFieldEmpty(String? fieldValue) => fieldValue?.isEmpty ?? true;
  bool isFieldEmail(String fieldValue) =>
      RegExpConstants.validEmail.hasMatch(fieldValue);
  bool isFieldValidPassword(String fieldValue) =>
      RegExpConstants.validPassword.hasMatch(fieldValue);
  bool isFieldValid<T>(
    T fieldValue,
    FieldValidator<T> validator,
  ) =>
      validator(fieldValue);

  bool checkIsCountryCodeCorrect(String? value) {
    if (value?.length != 2) return false;

    return true;
  }

  bool checkIsDateTimeInFuture(DateTime? value) {
    if (value == null) return false;

    final DateTime now = DateTime.now();

    if (!value.isAfter(now)) {
      return false;
    }

    return true;
  }
}
