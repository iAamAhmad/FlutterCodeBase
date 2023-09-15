import 'package:basics/responsives/dimensions.dart';
import 'package:basics/widgets/big_text.dart';
import 'package:basics/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import 'icon_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font23),
        SizedBox(height: Dimensions.height10),
        SmallText(text: 'With Special characteristics'),
        SizedBox(height: Dimensions.height10),
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
    );
  }
}
