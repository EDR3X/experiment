import 'package:dio/dio.dart';

class APIService {
  Dio _client = Dio();
  Future<Map<String, dynamic>> getAt(
      {String? url, Map<String, dynamic>? header}) async {
    Map<String, dynamic> value =
        (await _client.get("https://randomuser.me/api/")).data;
    return value;
  }
}
