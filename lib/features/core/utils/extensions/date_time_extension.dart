import 'package:intl/intl.dart';

extension TimeOfDayExtension on DateTime {
  String get asDateFormalFormattedString {
    final String formattedDate = DateFormat("dd-MM-yyyy").format(this);
    return formattedDate;
  }

  String get asDateTimeInformatlFormattedString {
    final String formattedDate = DateFormat("dd MMM yyyy, HH:mm").format(this);
    return formattedDate;
  }
}
