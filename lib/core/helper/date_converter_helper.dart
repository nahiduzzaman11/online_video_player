import 'package:intl/intl.dart';

class DateConverter {
  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-dd HH:mm:ss.SSSZ").parse(dateTime);
  }

  static String convertToString(String dateTime) {
    DateTime time = convertStringToDatetime(dateTime);
    String result = DateFormat.yMMMd().format(time);
    return result;
  }
}
