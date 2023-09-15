import 'package:basics/data/controller/popular_controller.dart';
import 'package:basics/resources/app_constants.dart';
import 'package:basics/responsives/dimensions.dart';
import 'package:basics/routes/routes_helper.dart';

import 'package:basics/widgets/app_column_reuse.dart';
import 'package:basics/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/colors.dart';

import '../../widgets/expandable_text.dart';
import '../../widgets/icon_widget.dart';

// ignore: must_be_immutable
class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct();

    return Scaffold(
        body: Stack(
          children: [
            //big hero section
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.baseUrl +
                      AppConstants.uploadUrl +
                      product.img),
                )),
              ),
            ),
            //showing to icons on hero Section
            Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              ),
            ),
            //big bottom container
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularImgSize - 20,
              child: Container(
                  height: Dimensions.popularImgSize,
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.width15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: product.name),
                      SizedBox(height: Dimensions.height20),
                      BigText(text: 'Introduction'),
                      SizedBox(height: Dimensions.height20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(text: product.description),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        //property of scaffold
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
            height: Dimensions.height130,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              left: Dimensions.height20,
              right: Dimensions.height20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20 * 2),
                topLeft: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //these are two containers having 2 sections for bottom bar
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height15,
                    right: Dimensions.width15,
                    left: Dimensions.width15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(width: Dimensions.width5),
                      BigText(text: popularProduct.quantity.toString()),
                      SizedBox(width: Dimensions.width5),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height15,
                    right: Dimensions.width15,
                    left: Dimensions.width15,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(
                        text: '\$ ${product.price} | Add to Carts ',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
