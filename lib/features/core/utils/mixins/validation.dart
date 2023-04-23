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

  // helpers below - could be just functions here

  bool checkIsCountryCodeCorrect(String value) {
    // TODO test - we can also check if this country code actually exists

    if (value.length != 2) return false;

    // TODO now check if the code exists somewhere maybe in some list
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
