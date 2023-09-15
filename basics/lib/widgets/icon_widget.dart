import 'package:basics/responsives/dimensions.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backGroundColor;
  final double size;

  const AppIcon({
    super.key,
    required this.icon,
    this.iconColor = const Color(0xFF756d54),
    this.backGroundColor = const Color(0xFFfcf4e4),
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backGroundColor,
      ),
      child: Icon(
        icon,
        size: Dimensions.iconSize16,
        color: iconColor,
      ),
    );
  }
}
