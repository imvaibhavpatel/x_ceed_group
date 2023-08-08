import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/utils/app_color.dart';

class CommonButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const CommonButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.85,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shadowColor: MaterialStatePropertyAll(AppColor.appColor),
          backgroundColor: MaterialStatePropertyAll(AppColor.appColor),
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
