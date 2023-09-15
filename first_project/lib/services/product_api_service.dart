import 'package:http/http.dart' as http;

import '../src/features/authentication/models/user_model.dart';

var base = 'https://dummyjson.com/';
getPosts() async {
  Uri uri = Uri.parse('$base/products');
  var response = await http.get(uri);
  if (response.statusCode == 200) {
    var data = personFromJson(response.body);
    return data.products;
  } else {
    return 'error';
  }
}
