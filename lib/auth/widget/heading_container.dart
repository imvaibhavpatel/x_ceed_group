import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/utils/images.dart';

class HeadingController extends StatelessWidget {
  final String? tittle;

  const HeadingController({super.key, this.tittle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.38,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: AppColor.appColor,
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 45),
          GestureDetector(
            onTap: () => Get.back(),
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
              ),
            ),
          ),
          Image.asset(
            LogInImage.logInImages,
            height: 220,
          ),
          const SizedBox(height: 15),
          Text(
            tittle!,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
            ),
          )
        ],
      ),
    );
  }
}
