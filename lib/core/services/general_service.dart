import 'package:intl/intl.dart';

class GeneralService {
  static String? formatDate(String? datetime){
    return datetime != null ?
      DateFormat("yyyy/mm/dd hh:mm a").format(DateTime.parse(datetime)): null;
  }
}