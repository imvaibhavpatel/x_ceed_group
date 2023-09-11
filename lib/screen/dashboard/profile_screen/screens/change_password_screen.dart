import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/profile_screen_controller.dart';
import 'package:xceed_group/utils/app_color.dart';

class ChangePasswordScreen extends StatelessWidget {
  final ProfileScreenController proScreenCon =
      Get.put(ProfileScreenController());

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Reset Password",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 100),
          child: Form(
            key: proScreenCon.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: proScreenCon.passCon,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                  validator: (pass) {
                    if (proScreenCon.passCon.text.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: proScreenCon.newPassCon,
                  decoration: InputDecoration(
                    hintText: "New Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        proScreenCon.isEyes1.value =
                            !proScreenCon.isEyes1.value;
                      },
                      icon: Icon(
                        proScreenCon.isEyes1.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.appColor,
                      ),
                    ),
                  ),
                  validator: (newPass) {
                    if (proScreenCon.newPassCon.text.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: proScreenCon.confirmPassCon,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        proScreenCon.isEyes2.value =
                            !proScreenCon.isEyes2.value;
                      },
                      icon: Icon(
                        proScreenCon.isEyes2.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.appColor,
                      ),
                    ),
                  ),
                  validator: (conPass) {
                    if (proScreenCon.confirmPassCon.text.isEmpty) {
                      return "Enter password";
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (proScreenCon.formKey.currentState!.validate()) {}
        },
        child: Container(
          width: Get.width,
          height: 50,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColor.appColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Save Password",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
