import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/register_as_consumer/register_as_consumer_screen.dart';
import 'package:xceed_group/auth/register_as_distributor/register_as_distributor_screen.dart';
import 'package:xceed_group/auth/register_as_retailer/register_as_retailer_screen.dart';

class LogInController extends GetxController {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isEyes = false.obs;
  RxInt category = 1.obs;

  registerForm() {
    if (category.value == 1) {
      Get.to(
        () => RegisterAsConsumerScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(
          milliseconds: 250,
        ),
      );
    } else if (category.value == 2) {
      Get.to(
        () => RegisterAsRetailerScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(
          milliseconds: 250,
        ),
      );
    } else {
      Get.to(
        () => RegisterAsDistributorScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(
          milliseconds: 250,
        ),
      );
    }
  }
}
