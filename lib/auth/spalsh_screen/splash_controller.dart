import 'dart:async';

import 'package:get/get.dart';
import 'package:xceed_group/auth/on_boarading_screen/on_boarding_screen.dart';

class SplashControlelr extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Timer(
      const Duration(seconds: 4),
          () => Get.to(
            () => OnBoardingScreen(),
      ),
    );
  }
}