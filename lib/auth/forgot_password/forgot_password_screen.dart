import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/forgot_password/forgot_password_controller.dart';
import 'package:xceed_group/auth/widget/heading_container.dart';
import 'package:xceed_group/utils/comman_text_field.dart';
import 'package:xceed_group/utils/common_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController forgotPassController =
      Get.put(ForgotPasswordController());

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HeadingController(tittle: "Forgot Password"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.40),
                 const Text(
                  "Please Enter Your Registered Email To Get New Password",
                ),
                const SizedBox(height: 30),
                TextFieldCommon(
                  hintText: "Enter mobile number",
                  controller: forgotPassController.forgotPaaMobController,
                  suffixIcon: const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 50),
                const Text("or"),
                const SizedBox(height: 10),
                TextFieldCommon(
                  hintText: "Enter registered email",
                  controller: forgotPassController.forgotPaaEmailController,
                  suffixIcon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                 SizedBox(height: Get.height *0.25),
                CommonButton(
                  text: "Submit",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
