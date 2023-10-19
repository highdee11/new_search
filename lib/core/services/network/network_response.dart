import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkResponse<T> {
  int? statusCode;
  T? data;
  String? message;


  NetworkResponse(http.Response response){
    statusCode = response.statusCode;
    data = jsonDecode(response.body);
    T dt = data as T;

    if(dt is Map){
      if(dt.containsKey('message')){
        message = dt['message'];
      }
    }
  }

  @override
  String toString() {
    return "$statusCode: $message => $data";
  }

}