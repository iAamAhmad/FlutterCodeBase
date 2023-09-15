import 'dart:convert';

import 'package:http/http.dart' as http;

import '../product_module/models/post_model.dart';

class PostApiService {
  static var client = http.Client();

  static Future<List<PostModel>?> fetchProducts() async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      var jsonString = response.body;

      // print(jsonString);
      return postModelFromJson(jsonString);
    } else {
      return null;
    }
  }
}
