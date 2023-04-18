import 'dart:async';

import 'package:five_on_four_flutter_tdd/features/core/domain/enums/form_field_error.dart';
import 'package:five_on_four_flutter_tdd/features/core/utils/mixins/validation.dart';
import 'package:flutter/material.dart';

mixin MatchCreateValidationMixin on ValidationMixin {
  // TODO helpers from here on
  late StreamTransformer<String, String> matchNameValidationTransformer =
      StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      final FormFieldError? nameError = _validateMatchName(data);

      if (nameError != null) {
        sink.addError(nameError);
        return;
      }

      sink.add(data);
    },
    handleError: (error, stackTrace, sink) {
      // TODO there should not be any errors here
      sink.addError(FormFieldError.invalid);
    },
  );

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
      // TODO there should not be any errors here
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
      // TODO there should not be any errors here
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

// TODO optional values here
  late StreamTransformer<TimeOfDay, TimeOfDay> timeValidationTransformer =
      StreamTransformer<TimeOfDay, TimeOfDay>.fromHandlers(
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
    // TODO this could be a function on validation mixin too
    final bool isValid = isFieldValid<String>(value, checkIsCountryCodeCorrect);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

//
  FormFieldError? _validateDate(DateTime? value) {
    // TODO this does not apply i guess
    final bool isEmpty = value == null;
    // TODO this could be a function on validation mixin too
    final bool isValid = isFieldValid<DateTime?>(value, (value) => true);

    FormFieldError? error;

    if (isEmpty) {
      error = FormFieldError.empty;
    } else if (!isValid) {
      error = FormFieldError.invalid;
    }

    return error;
  }

  FormFieldError? _validateTime(TimeOfDay value) {
    // TODO for now, keep as is
    // TODO later, only invalidate when empty, or when date is today, and time is before now
    return null; // No specific validation
  }
}
