import 'package:basics/api/api_client.dart';
import 'package:basics/data/controller/popular_controller.dart';
import 'package:basics/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

import '../data/controller/cart_controller.dart';
import '../data/controller/recomended_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/recomended_repo.dart';
import '../resources/app_constants.dart';

Future<void> init() async {
  //calling api client
  Get.lazyPut(() =>
      ApiClient(appBaseUrl: AppConstants.baseUrl)); //thi url is base point

  //calling repos here
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //calling controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recomendedProductRepo: Get.find()));
}
