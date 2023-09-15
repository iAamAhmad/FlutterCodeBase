import 'package:flutter/material.dart';

class btnElevated extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final int? fontSize;
  final double? width;
  final Function onPressed;
  const btnElevated(
      {super.key,
      required this.text,
      this.color,
      this.textColor,
      this.fontSize,
      required this.onPressed,
      this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.grey,
        backgroundColor: color,
        elevation: 7,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
        minimumSize: Size(300, 40), //////// HERE
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: textColor),
      ),
    );
  }
}
