import 'package:basics/data/controller/popular_controller.dart';

import 'package:basics/screens/home/main_food_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/controller/recomended_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'routes/routes_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  //todo:This is the last thing you need to add for getting firebase working
  //?await Firebase.initializeApp(
  //  *options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //calling the api from here
    //these are for calling to get data news from controller
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();
    //this get materialApp is being used to counter
    //get get package we used to make app responsive for us.
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
