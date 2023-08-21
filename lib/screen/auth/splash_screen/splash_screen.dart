import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/auth/splash_screen/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/xceed.png",
          height: 170,
        ),
      ),
    );
  }
}
