// import 'package:api_testing_application/product_module/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/post_controller.dart';

class PostListView extends StatelessWidget {
  // final ProductController productController = Get.put(ProductController());
  final PostController postController = Get.put(PostController());
  // ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: Obx(
        () => postController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: postController.postList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              margin: EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  postController.postList[index]
                                      .products![index].thumbnail
                                      .toString(),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    postController
                                        .postList[index].products![index].title
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
      ),
    );
  }
}
