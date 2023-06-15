import 'package:five_on_four_flutter_tdd/features/core/utils/constants/app_constants.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtension on DateTime {
  String get asDateFormalFormattedString {
    final String formattedDate =
        DateFormat(AppConstants.dateFormatFormal).format(this);
    return formattedDate;
  }

  String get asDateTimeInformalFormattedString {
    final String formattedDate =
        DateFormat(AppConstants.dateTimeFormatInformal).format(this);
    return formattedDate;
  }
}
