// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:basics/data/controller/popular_controller.dart';
import 'package:basics/data/controller/recomended_controller.dart';
import 'package:basics/resources/colors.dart';
import 'package:basics/responsives/dimensions.dart';
import 'package:basics/widgets/app_column_reuse.dart';
import 'package:basics/widgets/big_text.dart';
import 'package:basics/widgets/icon_text.dart';
import 'package:basics/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/popular_product_model.dart';
import '../../resources/app_constants.dart';
import '../../routes/routes_helper.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  //using this for getting some space of second screen
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = 220;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      //using this for printing value of pages on screen
      setState(() {
        _currentPageValue = pageController.page!;
        print('current value is $_currentPageValue');
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? Container(
                    height: Dimensions.pageViewMainContainer,
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: popularProducts.popularProductList.length,
                        itemBuilder: (
                          context,
                          position,
                        ) {
                          return _buildPageItem(position,
                              popularProducts.popularProductList[position]);
                        }),
                  )
                : CircularProgressIndicator(); //this is we are solving loading issue in images
          },
        ),
        // ignore: unnecessary_new
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeColor: AppColors.mainColor,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //starting to build popular text section
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: 'Recomended',
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        //building list view builder

        GetBuilder<RecomendedProductController>(builder: (recomendedProduct) {
          return recomendedProduct
                  .isLoaded // we are resolving loading issue here
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recomendedProduct.recomendedProductList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecomendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.width10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.listViewImageSize,
                              height: Dimensions.listViewImageSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.baseUrl +
                                        AppConstants.uploadUrl +
                                        recomendedProduct
                                            .recomendedProductList[index].img!),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                height: Dimensions.listViewTextSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10,
                                  ),
                                  child: AppColumn(
                                    text: recomendedProduct
                                        .recomendedProductList[index].name!,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    //building text section
                  }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    //this is we are doing all the stuff related
    // to height and transition of builder
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xff69c5df) : Color(0xff9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      AppConstants.baseUrl +
                          AppConstants.uploadUrl +
                          popularProduct.img!),
                ),
              ),
            ),
          ),
          // this is we are using to overlap two containers
          // which are are on same position after
          //stack widget
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.width30,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    )
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15,
                ),
                child: Column(
                  //horizontal axis is cross and y axis is main  axis
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: popularProduct.name!),
                    SizedBox(height: Dimensions.height10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //we are using this widget for creating one thing again
                        //and again
                        Wrap(
                          children: List.generate(
                            5, //this is the times of number we want for list
                            (index) {
                              return Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 18,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width5, // this height isn dynamic
                        ),
                        SmallText(text: '4.5'),
                        SizedBox(
                          width: Dimensions.width5,
                        ),
                        SmallText(text: '1297'),
                        SizedBox(
                          width: Dimensions.width5,
                        ),
                        SmallText(text: 'comments'),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height15,
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        IconText(
                          text: 'Normal',
                          iconColor: AppColors.iconColor1,
                          icon: Icons.circle_sharp,
                        ),
                        IconText(
                          text: '1.7km',
                          iconColor: AppColors.mainColor,
                          icon: Icons.location_on,
                        ),
                        //this is a custom component we are using again
                        //and again
                        IconText(
                          text: '32min',
                          iconColor: AppColors.iconColor2,
                          icon: Icons.access_time_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
