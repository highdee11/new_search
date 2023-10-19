import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'network_response.dart';

abstract class INetworkService {
  Future<NetworkResponse> get(String endpoint);
}


class NetworkService extends INetworkService {
  final String _baseURL = "https://newsapi.org/v2";
  final String _apiKey = "fa3fb31ad4ec490c966d4d70c5d3883c";
  static int successResponseCode = 200;

  @override
  Future<NetworkResponse> get(String endpoint, {Map<String, String>? headers}) async {
    Uri uri = Uri.parse('$_baseURL$endpoint&apiKey=$_apiKey');

    if (kDebugMode) {
      print("Get: => ${uri.toString()} => $headers");
    }

    http.Response response = await http.get(uri, headers: headers ?? {});
    NetworkResponse<Map> networkResponse = NetworkResponse<Map>(response);

    if (kDebugMode) {
      print(networkResponse.toString());
    }

    return Future.value(networkResponse);
  }
}