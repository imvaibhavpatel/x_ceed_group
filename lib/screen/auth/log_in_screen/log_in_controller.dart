import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:xceed_group/main.dart';
import 'package:xceed_group/screen/auth/register_as_consumer/register_as_consumer_screen.dart';
import 'package:xceed_group/screen/auth/register_as_distributor/register_as_distributor_screen.dart';
import 'package:xceed_group/screen/auth/register_as_retailer/register_as_retailer_screen.dart';
import 'package:xceed_group/screen/dashboard/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:xceed_group/utils/base_url.dart';

class LogInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final box = GetStorage();

  RxBool isEyes = false.obs;
  RxInt category = 1.obs;

  registerForm() {
    if (category.value == 1) {
      Get.back();
      Get.to(
        () => RegisterAsConsumerScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(
          milliseconds: 250,
        ),
      );
    } else if (category.value == 2) {
      Get.back();
      Get.to(
        () => RegisterAsRetailerScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(
          milliseconds: 250,
        ),
      );
    } else {
      Get.back();
      Get.to(
        () => RegisterAsDistributorScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(
          milliseconds: 250,
        ),
      );
    }
  }

  logIn() async {
    try {
      final response = await http.post(
        Uri.parse(AppUrl.baseUrl + AppUrl.logIn),
        body: {
          "email": emailController.text,
          "password": passwordController.text,
          "comp_id": "749",
          "format": "json",
        },
      );
      if (response.statusCode == 200) {
        box.write("token",
            jsonDecode(response.body)["response"]["result"]["token"] ?? "");
        box.write("userId",
            jsonDecode(response.body)["response"]["result"]["user_id"] ?? "");
        baseController?.getData();
        Get.to(() => BottomBarScreen());
      } else {
        debugPrint("some error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    logIn();
  }
}
