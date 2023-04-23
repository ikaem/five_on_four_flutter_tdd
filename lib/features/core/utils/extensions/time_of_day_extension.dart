import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  DateTime get nowWithTodayDate {
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
}
