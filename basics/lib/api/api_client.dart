// ignore_for_file: unused_field

import 'package:get/get.dart';

import '../resources/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token; //necessary to get call and talk with server
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.appToken;
    _mainHeaders = {
      'ContentType': 'application/json;charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response();
    }
  }
}
