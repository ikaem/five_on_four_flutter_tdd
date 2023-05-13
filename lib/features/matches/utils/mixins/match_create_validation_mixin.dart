import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/domain/enums/form_field_error.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:five_on_four_flutter_tdd/features/matches/domain/values/match_create_inputs_validation/value.dart';
import 'package:flutter/material.dart';

mixin MatchCreateValidationMixin on ValidationMixin {
  bool inputValuesValidator(List<Object?> values) {
    // TODO this is old
    // final String? name = _nameSubject.valueOrNull;
    // final String? locationName = _locationNameSubject.valueOrNull;
    // final String? locationAddress = _locationAddressSubject.valueOrNull;
    // final String? locationCity = _locationCitySubject.valueOrNull;
    // final String? locationCountry = _locationCountrySubject.valueOrNull;
    // final DateTime? date = _dateSubject.valueOrNull;
    // final TimeOfDay? time = _timeSubject.valueOrNull;

    final String? name = values[0] as String?;
    final String? locationName = values[1] as String?;
    final String? locationAddress = values[2] as String?;
    final String? locationCity = values[3] as String?;
    final String? locationCountry = values[4] as String?;
    final DateTime? date = values[5] as DateTime?;
    final TimeOfDay? time = values[6] as TimeOfDay?;

    final MatchCreateInputsValidationValue validationValue = validateInputs(
      nameValue: name,
      locationNameValue: locationName,
      locationAddressValue: locationAddress,
      locationCityValue: locationCity,
      locationCountryValue: locationCountry,
      dateValue: date,
      timeValue: time,
    );

    return validationValue.areInputsValid;
  }

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

  late StreamTransformer<String, String> locationCountryValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validateLocationCountry(data);

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

  late StreamTransformer<DateTime?, DateTime?> dateValidationTransformer =
      StreamTransformer<DateTime?, DateTime?>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validateDate(data);

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

  late StreamTransformer<TimeOfDay?, TimeOfDay?> timeValidationTransformer =
      StreamTransformer<TimeOfDay?, TimeOfDay?>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? error = _validateTime(data);

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

  late StreamTransformer<bool, bool> joinMatchValidationTransformer =
      StreamTransformer<bool, bool>.fromHandlers(
    handleData: (data, sink) {
      sink.add(data);
    },
    handleError: (error, stackTrace, sink) {
      sink.addError(FormFieldError.invalid);
    },
  );

// TODO this should probably be in general validation mixin
  FormFieldError? _validateGenericText(String? value) {
    final bool isEmpty = isFieldEmpty(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    }

    return error;
  }

  FormFieldError? _validateLocationCountry(String? value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid =
        isFieldValid<String?>(value, checkIsCountryCodeCorrect);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validateDate(DateTime? value) {
    final bool isEmpty = value == null;
    final bool isValid = isFieldValid<DateTime?>(value, (value) {
      if (value == null) return false;

      return true;
    });

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validateTime(TimeOfDay? value) {
    final bool isEmpty = value == null;
    final bool isValid = isFieldValid<TimeOfDay?>(value, (value) {
      if (value == null) return false;

      return true;
    });

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  MatchCreateInputsValidationValue validateInputs({
    required String? nameValue,
    required String? locationNameValue,
    required String? locationAddressValue,
    required String? locationCityValue,
    required String? locationCountryValue,
    required DateTime? dateValue,
    required TimeOfDay? timeValue,
  }) {
    final FormFieldError? nameError = _validateGenericText(nameValue);
    final FormFieldError? locationNameError =
        _validateGenericText(locationNameValue);
    final FormFieldError? locationAddressnput =
        _validateGenericText(locationAddressValue);
    final FormFieldError? locationCityError =
        _validateGenericText(locationCityValue);
    final FormFieldError? locationCountryError =
        _validateLocationCountry(locationCountryValue);
    final FormFieldError? dateError = _validateDate(dateValue);
    final FormFieldError? timeError = _validateTime(timeValue);

    final MatchCreateInputsValidationValue validationValue =
        MatchCreateInputsValidationValue(
      nameError: nameError,
      locationNameError: locationNameError,
      locationAddressError: locationAddressnput,
      locationCityError: locationCityError,
      locationCountryError: locationCountryError,
      dateError: dateError,
      timeError: timeError,
    );

    return validationValue;
  }
}
