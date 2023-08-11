import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/log_in_screen/log_in_controller.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/utils/icons.dart';

class DialogContainer extends StatelessWidget {
  final LogInController logInController = Get.put(LogInController());

  DialogContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          height: Get.height * 0.45,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
              Text(
                "Register as",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      logInController.category.value = 1;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 70,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: logInController.category.value == 1
                              ? AppColor.appColor
                              : Colors.black,
                        ),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColor.appColor,
                            child: Image.asset(
                              RegisterCategoryIcons.customers,
                              height: 80,
                              width: 40,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Consumer",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      logInController.category.value = 2;
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 70,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: logInController.category.value == 2
                              ? AppColor.appColor
                              : Colors.black,
                        ),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColor.appColor,
                            child: Image.asset(
                              RegisterCategoryIcons.retailer,
                              height: 80,
                              width: 40,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Retailer",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      logInController.category.value = 3;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                        bottom: 70,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: logInController.category.value == 3
                              ? AppColor.appColor
                              : Colors.black,
                        ),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColor.appColor,
                            child: Image.asset(
                              RegisterCategoryIcons.distributor,
                              height: 80,
                              width: 40,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Distributor",
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: Get.width * 0.65,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.appColor),
                  onPressed: () {
                    logInController.registerForm();
                  },
                  child: const Text("Proceed"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
