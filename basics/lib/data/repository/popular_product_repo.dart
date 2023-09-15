import 'package:basics/api/api_client.dart';
import 'package:get/get.dart';

import '../../resources/app_constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    //base point for initialize and end point at the time of getting
    //data from server
    return await apiClient.getData(AppConstants.endUrl); //this url is end point
  }
}
