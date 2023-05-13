import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  DateTime get toTodayDateTime {
    final DateTime now = DateTime.now();
    final DateTime date = DateTime(
      now.year,
      now.month,
      now.day,
      this.hour,
      this.minute,
    );

    return date;
  }

// TODO maybe these should be extending datetime instead
  DateTime toCustomDateTime(DateTime customDateTime) {
    final DateTime date = DateTime(
      customDateTime.year,
      customDateTime.month,
      customDateTime.day,
      this.hour,
      this.minute,
    );

    return date;
  }
}
