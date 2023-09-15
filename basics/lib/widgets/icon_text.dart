import 'package:basics/responsives/dimensions.dart';
import 'package:basics/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final String text;

  final Color iconColor;
  final IconData icon;

  const IconText(
      {Key? key,
      required this.text,
      required this.iconColor,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SmallText(
          text: text,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
      ],
    );
  }
}
