import 'package:intl/intl.dart';

class DateUtil {
  static final DateFormat formatterDate = DateFormat('dd/MM/yyyy');

  static String format(DateTime date) {
    return formatterDate.format(date);
  }

  static DateTime toDateTime(String date) {
    return formatterDate.parse(date);
  }
}
