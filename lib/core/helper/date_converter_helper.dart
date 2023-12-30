import 'package:intl/intl.dart';

class DateConverter {

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static String convertToString(String dateTime) {
    DateTime time = convertStringToDatetime(dateTime);
    String result = DateFormat('MMM d, y').format(time);
    return result;
  }
}
