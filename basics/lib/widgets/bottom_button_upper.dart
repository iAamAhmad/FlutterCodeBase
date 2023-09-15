import 'package:basics/resources/colors.dart';
import 'package:basics/responsives/dimensions.dart';
import 'package:basics/widgets/big_text.dart';
import 'package:flutter/material.dart';

class BottomButtonUpper extends StatelessWidget {
  const BottomButtonUpper({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Icon(
              Icons.favorite,
              color: AppColors.mainColor,
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
                  text: '\$10 | Add to Carts ',
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
