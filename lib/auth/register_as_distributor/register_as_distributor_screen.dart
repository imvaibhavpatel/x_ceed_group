import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/register_as_distributor/distributor_controller.dart';
import 'package:xceed_group/auth/widget/check_terms_condition.dart';
import 'package:xceed_group/auth/widget/heading_container.dart';
import 'package:xceed_group/utils/comman_text_field.dart';
import 'package:xceed_group/utils/common_button.dart';

class RegisterAsDistributorScreen extends StatelessWidget {
  final DistributorController distributorController =
      Get.put(DistributorController());

  RegisterAsDistributorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HeadingController(tittle: "Register as Distributor"),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: distributorController.retailerRegKey,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.45),
                      TextFieldCommon(
                        hintText: "Full Name*",
                        controller: distributorController.fullNameController,
                        validation: (name) {
                          if (distributorController
                              .fullNameController.text.isEmpty) {
                            return "Enter full name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Firm Name*",
                        controller: distributorController.firmController,
                        validation: (firm) {
                          if (distributorController
                              .firmController.text.isEmpty) {
                            return "Enter firm name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Mobile Number*",
                        controller: distributorController.mobileNoController,
                        validation: (mobile) {
                          if (distributorController
                              .mobileNoController.text.isEmpty) {
                            return "Enter mobile number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Email",
                        controller:
                            distributorController.registerRetEmailController,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFieldCommon(
                              hintText: "Attach Adhaar card Doc*",
                              controller:
                                  distributorController.adhaarImageController,
                              onTap: () => distributorController.getAdhaarDoc(),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                              validation: (adhaarImage) {
                                if (distributorController
                                    .adhaarImageController.text.isEmpty) {
                                  return "Select adhaar card image";
                                }
                                return null;
                              },
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: distributorController
                                    .adhaarImageController.text.isNotEmpty
                                ? Colors.green
                                : Colors.grey.shade300,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFieldCommon(
                              hintText: "Attach Pan card Doc*",
                              controller:
                                  distributorController.panImageController,
                              onTap: () =>
                                  distributorController.getPanCardDoc(),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                              validation: (panImage) {
                                if (distributorController
                                    .panImageController.text.isEmpty) {
                                  return "Select adhaar card image";
                                }
                                return null;
                              },
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: distributorController
                                    .panImageController.text.isNotEmpty
                                ? Colors.green
                                : Colors.grey.shade300,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Firm Registration",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "GST Number",
                        controller: distributorController.gstNumController,
                        validation: (gstNum) {
                          if (gstNum == "") {
                            return "Enter GST number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFieldCommon(
                              hintText: "Attach GST Doc*",
                              controller:
                                  distributorController.gstImageController,
                              onTap: () => distributorController.getGstDoc(),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                              validation: (gstImage) {
                                if (distributorController
                                    .gstImageController.text.isEmpty) {
                                  return "Select GST doc image";
                                }
                                return null;
                              },
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: distributorController
                                    .gstImageController.text.isNotEmpty
                                ? Colors.green
                                : Colors.grey.shade300,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        maxLine: 5,
                        hintText: "Register Address",
                        controller: distributorController.addressController,
                        validation: (address) {
                          if (distributorController
                              .addressController.text.isEmpty) {
                            return "Enter address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Pin code",
                        controller: distributorController.pinCodeController,
                        validation: (pinCode) {
                          if (pinCode == "") {
                            return "Enter pin code";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Optional Details",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Other Brands",
                        controller: distributorController.brandController,
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Turn Over",
                        controller: distributorController.turnOverController,
                      ),
                      const SizedBox(height: 10),
                      CheckTermCondition(
                        value: distributorController.isCheck.value,
                        onChanged: (value) {
                          distributorController.isCheck.value =
                              !distributorController.isCheck.value;
                        },
                      ),
                      CommonButton(
                        text: "Register",
                        onPressed: () {
                          if (distributorController.retailerRegKey.currentState!
                              .validate()) {}
                        },
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
