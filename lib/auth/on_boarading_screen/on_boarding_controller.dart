import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxInt currentPage = 0.obs;
  PageController pageController = PageController();

  RxList onBoardingData = [
    {
      "tittle": "Easy to Use",
      "description": "Quickly find the product you want to its easy interface.",
      "image": "assets/images/onb1.png",
    },
    {
      "tittle": "High Level Security",
      "description":
          "Your information is safe with advanced encryption feature.",
      "image": "assets/images/onb2.png",
    },
    {
      "tittle": "7-24 Support",
      "description": "Any problem you can quickly support team immediately.",
      "image": "assets/images/onb3.png",
    },
  ].obs;
}
