// ignore_for_file: unnecessary_string_interpolations

import 'package:get/get.dart';

import '../screens/food details/popular_food_detail.dart';
import '../screens/food details/recomended_food-detail.dart';
import '../screens/home/main_food_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular_Food';
  static const String recommendedFood = '/recommended_Food';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getInitial() => '$initial';
  static String getRecomendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => MainFoodPage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
  ];
}
