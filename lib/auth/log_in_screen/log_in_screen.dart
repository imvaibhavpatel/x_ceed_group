import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/log_in_screen/log_in_controller.dart';
import 'package:xceed_group/auth/log_in_screen/widget/dialog_container.dart';
import 'package:xceed_group/utils/comman_text_field.dart';
import 'package:xceed_group/utils/images.dart';

class LogInScreen extends StatelessWidget {
  final LogInController logInController = Get.put(LogInController());

  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height * 0.36,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade200,
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 55),
                Image.asset(
                  LogInImage.logInImages,
                  height: 220,
                ),
                const SizedBox(height: 15),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
          ),
          Obx(
            () => Form(
              key: logInController.formKey,
              child: SingleChildScrollView(
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
                          color: Colors.blue.shade800,
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
                    SizedBox(
                      width: Get.width * 0.85,
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shadowColor:
                              MaterialStatePropertyAll(Colors.blue.shade800),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue.shade800),
                        ),
                        onPressed: () {
                          if (logInController.formKey.currentState!
                              .validate()) {}
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(DialogContainer());
                          },
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
          )
        ],
      ),
    );
  }
}
