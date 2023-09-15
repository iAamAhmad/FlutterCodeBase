import 'package:api_testing_application/product_module/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<ProductModel>> fetchProducts() async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productModelFromJson(jsonString);
    } else {
      return [];
    }
  }
}
