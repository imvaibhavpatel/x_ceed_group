import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/utils/images.dart';

class OnBoardingController extends GetxController {
  RxInt currentPage = 0.obs;
  PageController pageController = PageController();

  RxList onBoardingData = [
    {
      "tittle": "Easy to Use",
      "description": "Quickly find the product you want to its easy interface.",
      "image": OnBoardingImages.onb1,
    },
    {
      "tittle": "High Level Security",
      "description":
          "Your information is safe with advanced encryption feature.",
      "image": OnBoardingImages.onb2,
    },
    {
      "tittle": "7-24 Support",
      "description": "Any problem you can quickly support team immediately.",
      "image": OnBoardingImages.onb3,
    },
  ].obs;
}
