import 'package:basics/api/api_client.dart';
import 'package:get/get.dart';

import '../../resources/app_constants.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiClient;

  RecomendedProductRepo({required this.apiClient});

  Future<Response> getRecomendedProductList() async {
    //base point for initialize and end point at the time of getting
    //data from server
    return await apiClient
        .getData(AppConstants.recomendedEndUrl); //this url is end point
  }
}
