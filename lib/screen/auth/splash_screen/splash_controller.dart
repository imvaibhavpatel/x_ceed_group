import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xceed_group/screen/auth/on_boarading_screen/on_boarding_screen.dart';
import 'package:xceed_group/screen/dashboard/bottom_bar_screen/bottom_bar_screen.dart';

class SplashController extends GetxController {
  var box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(
      const Duration(seconds: 3),
      () async {
        // baseCon!.getData();
        var token = await box.read("user_token");

        if (token.toString() != "null" && token.toString().isNotEmpty) {
          Get.to(() => BottomBarScreen());
        } else {
          Get.to(() => OnBoardingScreen());
        }
      },
    );
  }
}
