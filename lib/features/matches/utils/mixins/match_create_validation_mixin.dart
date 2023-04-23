import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/domain/enums/form_field_error.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:flutter/material.dart';

mixin MatchCreateValidationMixin on ValidationMixin {
  // late StreamTransformer<String, String> matchNameValidationTransformer =
  //     StreamTransformer<String, String>.fromHandlers(
  //   handleData: (data, sink) {
  //     final FormFieldError? nameError = _validateMatchName(data);

  //     if (nameError != null) {
  //       sink.addError(nameError);
  //       return;
  //     }

  //     sink.add(data);
  //   },
  //   handleError: (error, stackTrace, sink) {
  //     sink.addError(FormFieldError.invalid);
  //   },
  // );

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
    // handleError: (error, stackTrace, sink) {
    //   sink.addError(FormFieldError.invalid);
    // },
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
      // TODO no much need for validation here
      // TODO so we dont even need this transformer

      sink.add(data);
    },
    handleError: (error, stackTrace, sink) {
      sink.addError(FormFieldError.invalid);
    },
  );

  FormFieldError? _validateMatchName(String value) {
    final bool isEmpty = isFieldEmpty(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    }

    return error;
  }

  FormFieldError? _validateGenericText(String value) {
    final bool isEmpty = isFieldEmpty(value);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    }

    return error;
  }

  FormFieldError? _validateLocationCountry(String value) {
    final bool isEmpty = isFieldEmpty(value);
    final bool isValid = isFieldValid<String>(value, checkIsCountryCodeCorrect);

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

      final DateTime nowDate = DateTime.now();

// TODO just testing this
      // if (!value.isAfter(nowDate)) return false;

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

// TODO just testing this

      // final DateTime picketTimeWithTodayDate = value.nowWithTodayDate;
      // final TimeOfDay nowDate = TimeOfDay.now();
      // final DateTime nowWithTodayDate =
      //     nowDate.nowWithTodayDate.add(Duration(minutes: -1));

      // if (!picketTimeWithTodayDate.isAfter(nowWithTodayDate)) {
      //   return false;
      // }

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

  // TODO test - use this for inputs validation strea, but maybe also for on submit validation
  // TODO for now, return true or false, but later, it should probably return validation value
  MatchCreateInputsValidationValue validateInputs({
    required String matchNameValue,
    required String locationNameValue,
    required String locationAddressValue,
    required String locationCityValue,
    required String locationCountryValue,
    required DateTime? dateValue,
    required TimeOfDay? timeValue,
  }) {
    final FormFieldError? matchNameError = _validateGenericText(matchNameValue);
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
      matchNameError: matchNameError,
      locationNameError: locationNameError,
      locationAddressnput: locationAddressnput,
      locationCityError: locationCityError,
      locationCountryError: locationCountryError,
      dateError: dateError,
      timeError: timeError,
    );

    return validationValue;
  }
}

// TODO move to values - also maybe reuse for non real time validation
// and then use its properties to sent sink in the controller

@immutable
class MatchCreateInputsValidationValue {
  const MatchCreateInputsValidationValue({
    required this.matchNameError,
    required this.locationNameError,
    required this.locationAddressnput,
    required this.locationCityError,
    required this.locationCountryError,
    required this.dateError,
    required this.timeError,
  });

  final FormFieldError? matchNameError;
  final FormFieldError? locationNameError;
  final FormFieldError? locationAddressnput;
  final FormFieldError? locationCityError;
  final FormFieldError? locationCountryError;
  final FormFieldError? dateError;
  final FormFieldError? timeError;

  bool get areInputsValid {
    if (matchNameError != null) return false;
    if (locationNameError != null) return false;
    if (locationAddressnput != null) return false;
    if (locationCityError != null) return false;
    if (locationCountryError != null) return false;
    if (dateError != null) return false;
    if (timeError != null) return false;

    return true;
  }
}
