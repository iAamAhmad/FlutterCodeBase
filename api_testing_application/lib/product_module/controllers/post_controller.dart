import 'package:api_testing_application/product_module/models/product_model.dart';
import 'package:get/get.dart';

import '../../api_module/api_services.dart';
import '../../api_module/post_api_service.dart';
import '../models/post_model.dart';

class PostController extends GetxController {
  final postList = <PostModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await PostApiService.fetchProducts();
      if (products!.isEmpty) {
        postList.assignAll(products);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
