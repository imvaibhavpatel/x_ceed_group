import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/widget/check_terms_condition.dart';
import 'package:xceed_group/auth/widget/heading_container.dart';
import 'package:xceed_group/utils/common_button.dart';
import 'package:xceed_group/auth/register_as_consumer/consumer_controller.dart';
import 'package:xceed_group/auth/widget/comman_text_field.dart';

class RegisterAsConsumerScreen extends StatelessWidget {
  final ConsumerController consumerController = Get.put(ConsumerController());

  RegisterAsConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HeadingController(tittle: "Register as Consumer"),
          Obx(
            () => Form(
              key: consumerController.consumerRegKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.45),
                    TextFieldCommon(
                      hintText: "Full Name*",
                      controller: consumerController.fullNameController,
                      validation: (name) {
                        if (name == "") {
                          return "Enter full name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFieldCommon(
                      hintText: "Mobile Number*",
                      controller: consumerController.mobileNoController,
                      validation: (mobile) {
                        if (mobile == "") {
                          return "Enter mobile number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFieldCommon(
                      hintText: "Email",
                      controller: consumerController.registerEmailController,
                    ),
                    const SizedBox(height: 10),
                    TextFieldCommon(
                      hintText: "Password",
                      controller: consumerController.registerPassController,
                      validation: (password) {
                        if (password == "") {
                          return "Enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFieldCommon(
                      hintText: "Retype Password",
                      controller:
                          consumerController.registerRetypePassController,
                      validation: (reTypePass) {
                        if (reTypePass == "") {
                          return "Enter password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    CheckTermCondition(
                      value: consumerController.isCheck.value,
                      onChanged: (value) {
                        consumerController.isCheck.value =
                            !consumerController.isCheck.value;
                      },
                    ),
                    CommonButton(
                      text: "Register",
                      onPressed: () {
                        if (consumerController.consumerRegKey.currentState!
                            .validate()) {
                          FocusScope.of(context).unfocus();

                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
