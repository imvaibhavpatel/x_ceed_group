import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/forgot_password/forgot_password_screen.dart';
import 'package:xceed_group/auth/log_in_screen/log_in_controller.dart';
import 'package:xceed_group/auth/widget/heading_container.dart';
import 'package:xceed_group/utils/common_button.dart';
import 'package:xceed_group/auth/log_in_screen/widget/dialog_container.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/auth/widget/comman_text_field.dart';

class LogInScreen extends StatelessWidget {
  final LogInController logInController = Get.put(LogInController());

  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HeadingController(tittle: "Login"),
          Obx(
            () => Form(
              key: logInController.formKey,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.45),
                      TextFieldCommon(
                        hintText: "Mobile No/ Email",
                        controller: logInController.emailController,
                      ),
                      const SizedBox(height: 20),
                      TextFieldCommon(
                        hintText: "Password",
                        controller: logInController.passwordController,
                        suffixIcon: IconButton(
                          onPressed: () {
                            logInController.isEyes.value =
                                !logInController.isEyes.value;
                          },
                          icon: Icon(
                            logInController.isEyes.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColor.appColor,
                          ),
                        ),
                        validation: (password) {
                          if (password!.isEmpty) {
                            return "Enter Password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CommonButton(
                        text: "Sign In",
                        onPressed: () {
                          if (logInController.formKey.currentState!
                              .validate()) {
                            FocusScope.of(context).unfocus();
                            logInController.logIn();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => Get.to(
                          () => ForgotPasswordScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                        ),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Do you have an account?"),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () => Get.dialog(DialogContainer()),
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.red.shade600),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
