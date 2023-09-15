import 'package:api_testing_application/product_module/models/product_model.dart';
import 'package:get/get.dart';

import '../../api_module/api_services.dart';

class ProductController extends GetxController {
  final productList = <ProductModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products.isNotEmpty) {
        productList.assignAll(products);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
