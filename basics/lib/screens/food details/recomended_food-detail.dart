// ignore_for_file: avoid_unnecessary_containers

import 'package:basics/responsives/dimensions.dart';
import 'package:basics/widgets/big_text.dart';
import 'package:basics/widgets/bottom_button_upper.dart';
import 'package:basics/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/recomended_controller.dart';
import '../../resources/app_constants.dart';
import '../../routes/routes_helper.dart';
import '../../widgets/bottom_buttons.dart';
import '../../widgets/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecomendedProductController>().recomendedProductList[pageId];
    return Scaffold(
      body: CustomScrollView(
        //we are using this for getting different desired effects
        //and for using this other purposes
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart),
              ],
            ),
            toolbarHeight: 75,
            pinned: true,
            //size from top while scrolling towards top
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height10,
                  bottom: Dimensions.height10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                width: double.maxFinite,
                child: Center(
                  child: BigText(size: Dimensions.font26, text: product.name!),
                ),
              ),
            ),
            backgroundColor: Colors.amber,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.baseUrl + AppConstants.uploadUrl + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                  ),
                  child: ExpandableText(
                    text: product.description!,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        BottomButtons(), //custom button i made for using again again
        BottomButtonUpper(),
      ]),
    );
  }
}
