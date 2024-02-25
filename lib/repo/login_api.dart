import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class LoginApi {
  Client _client = Client();
  static String baseApi = "localhost:3000/api/v1";
  static String loginApi = "$baseApi/auth";

  login(int phone, String password) async {
    try {
      final _body = {
        'phone': phone,
        'password': password,
      };
      Map<String, String> heading = {
        'Content-Type': 'application/json',
      };
      final response = await _client.post(Uri.parse(loginApi),
          body: _body, headers: heading);
      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        log(body.toString());
        return body;
      } else {
        log("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
