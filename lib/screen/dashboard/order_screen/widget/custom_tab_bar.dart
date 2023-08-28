import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatelessWidget {
  final String? tabText;
  final Color? color;
  final Color? underLine;
  final GestureTapCallback? onTap;

  const CustomTabBar(
      {super.key, this.tabText, this.color, this.underLine, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            tabText!,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 3,
            width: Get.width * 0.50,
            color: underLine,
          )
        ],
      ),
    );
  }
}
