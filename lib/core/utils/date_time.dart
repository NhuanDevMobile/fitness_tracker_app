import 'package:intl/intl.dart';

class DatetimeUtil {
  static String formatDateTimeFormat(DateTime dateTime) {
    String formattedDate = DateFormat('d MMMM, EEEE').format(dateTime);
    return formattedDate;
  }
}
