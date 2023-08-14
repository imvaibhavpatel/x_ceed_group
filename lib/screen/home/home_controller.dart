import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();

  RxInt currentPage = 0.obs;
  RxInt currentBottomPage = 1.obs;


}
