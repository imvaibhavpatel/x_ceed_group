import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItemColumn extends StatelessWidget {
  final String? text;
  final Color? color;
  final GestureTapCallback? onTap;
  final String? image;

  const BottomBarItemColumn({super.key, this.text, this.color, this.onTap, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
           image!,
            color: color,
          ),
          Text(
            text!,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
