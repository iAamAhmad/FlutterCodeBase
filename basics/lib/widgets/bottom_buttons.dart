import 'package:basics/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../responsives/dimensions.dart';
import 'big_text.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Dimensions.height10 / 2,
        left: Dimensions.height20,
        right: Dimensions.height20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius20 * 2),
          topLeft: Radius.circular(Dimensions.radius20 * 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //these are two containers having 2 sections for bottom bar
          AppIcon(
            icon: Icons.add,
            iconColor: Colors.white,
            backGroundColor: AppColors.mainColor,
          ),
          BigText(text: '\$28.3 X 0'),
          AppIcon(
            icon: Icons.remove,
            iconColor: Colors.white,
            backGroundColor: AppColors.mainColor,
          ),
        ],
      ),
    );
  }
}
