import 'dart:convert';
import 'dart:developer';

import 'package:bloc_api/model/post_model.dart';
import 'package:http/http.dart';

class PostApi {
  String url = "https://jsonplaceholder.typicode.com/todos/";
  final Client _client = Client();

  Future<List<PostModel>> fetchPostApi() async {
    Response response = await _client.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map((e) => PostModel.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
