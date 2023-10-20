import 'package:intl/intl.dart';

class GeneralService {
  static String? formatDate(String? datetime){
    try{
      return datetime != null ?
      DateFormat("yyyy/MM/dd hh:mm a").format(DateTime.parse(datetime)): null;
    }catch(e){
      return null;
    }
  }
}