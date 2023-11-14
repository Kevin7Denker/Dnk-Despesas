import 'package:intl/intl.dart';

extension DateFormatUtils on DateFormat {
  String toBR(DateTime data) {
    return DateFormat("dd/MM/yyyy").format(data);
  }
}
