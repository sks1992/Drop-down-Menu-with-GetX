import 'package:intl/intl.dart';

DateFormat dateFormatMN = DateFormat('dd MMM yyyy');
DateFormat dateFormatMNTime = DateFormat('dd MMM yyyy hh:mm a');
NumberFormat numberFormat = NumberFormat('##,##,###.##');

String getFormattedDate(String? date) {
  if (date == null || date.isEmpty) {
    return "-";
  }
  return dateFormatMN.format(DateTime.parse(date));
}

String getFormattedDateTime(String? date) {
  if (date == null || date.isEmpty) {
    return "-";
  }
  return dateFormatMNTime.format(DateTime.parse(date));
}

String getFormattedAmount(double value) {
  final rupeeSymbol = "\u20B9";
  if (value == null) {
    return "$rupeeSymbol 0";
  }
  return "$rupeeSymbol ${numberFormat.format(value)}";
}

String getFormattedValue(double value) {
  return numberFormat.format(value);
}
