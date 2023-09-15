import 'package:basics/models/popular_product_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../repository/recomended_repo.dart';

class RecomendedProductController extends GetxController {
  final RecomendedProductRepo recomendedProductRepo;

  RecomendedProductController({required this.recomendedProductRepo});
  List<ProductModel> _recomendedProductList = [];
  List<ProductModel> get recomendedProductList => _recomendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecomendedProductList() async {
    Response response = await recomendedProductRepo.getRecomendedProductList();
    if (response.statusCode == 200) {
      _recomendedProductList = [];
      _recomendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('somethings has happened');
    }
  }
}
