
import 'dart:convert';
import 'package:http/http.dart' as http;

NetworkService net = NetworkService();

class NetworkService {
  // static final NetworkService _instance = NetworkService._internal();
  //
  // factory NetworkService() {
  //   return _instance;
  // }
  //
  // NetworkService._internal() {
  //
  // }

  static Future<dynamic> get(
      {Map<String, String>? header, required String url}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: header ?? {

      });
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> post(
      {Map<String, dynamic>? body, required String url}) async {
    try {
      final response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {

        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<dynamic> patch(
      {Map<String, dynamic>? body, required String url}) async {
    try {
      final response = await http.patch(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> delete(
      {Map<String, dynamic>? body, required String url}) async {
    try {
      final response = await http.delete(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

