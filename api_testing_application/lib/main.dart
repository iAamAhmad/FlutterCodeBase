import 'package:api_testing_application/product_module/screens/post_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_module/screens/product_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Testing',
      home: PostListView(),
    );
  }
}
