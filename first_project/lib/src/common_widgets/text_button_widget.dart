import 'package:flutter/material.dart';

class ButtonWidgetText extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final int? fontSize;
  final Function onPressed;
  const ButtonWidgetText(
      {super.key,
      required this.text,
      this.color,
      this.textColor,
      this.fontSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
