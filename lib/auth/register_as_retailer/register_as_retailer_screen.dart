import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/register_as_retailer/retailer_controller.dart';
import 'package:xceed_group/auth/widget/check_terms_condition.dart';
import 'package:xceed_group/auth/widget/heading_container.dart';
import 'package:xceed_group/utils/common_button.dart';
import 'package:xceed_group/utils/comman_text_field.dart';

class RegisterAsRetailerScreen extends StatelessWidget {
  final RetailerController retailerController = Get.put(RetailerController());

  RegisterAsRetailerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const HeadingController(tittle: "Register as Retailer"),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: retailerController.retailerRegKey,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * 0.45),
                      TextFieldCommon(
                        hintText: "Full Name*",
                        controller: retailerController.fullNameController,
                        validation: (name) {
                          if (retailerController
                              .fullNameController.text.isEmpty) {
                            return "Enter full name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Firm Name*",
                        controller: retailerController.firmController,
                        validation: (firm) {
                          if (retailerController.firmController.text.isEmpty) {
                            return "Enter firm name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Mobile Number*",
                        controller: retailerController.mobileNoController,
                        validation: (mobile) {
                          if (retailerController
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
                            retailerController.registerRetEmailController,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextFieldCommon(
                              hintText: "Attach Adhaar card Doc*",
                              controller:
                                  retailerController.adhaarImageController,
                              onTap: () => retailerController.getAdhaarDoc(),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                              validation: (adhaarImage) {
                                if (retailerController
                                    .adhaarImageController.text.isEmpty) {
                                  return "Select adhaar card image";
                                }
                                return null;
                              },
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: retailerController
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
                              controller: retailerController.panImageController,
                              onTap: () => retailerController.getPanCardDoc(),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                              validation: (panImage) {
                                if (retailerController
                                    .panImageController.text.isEmpty) {
                                  return "Select adhaar card image";
                                }
                                return null;
                              },
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: retailerController
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
                        controller: retailerController.gstNumController,
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
                              controller: retailerController.gstImageController,
                              onTap: () => retailerController.getGstDoc(),
                              suffixIcon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                              ),
                              validation: (gstImage) {
                                if (retailerController
                                    .gstImageController.text.isEmpty) {
                                  return "Select GST doc image";
                                }
                                return null;
                              },
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: retailerController
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
                        controller: retailerController.addressController,
                        validation: (address) {
                          if (retailerController
                              .addressController.text.isEmpty) {
                            return "Enter address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CSCPicker(
                        layout: Layout.vertical,
                        dropdownDecoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey.shade200,
                        ),
                        selectedItemStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        dropdownItemStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        dropdownDialogRadius: 5,
                        searchBarRadius: 5,
                        flagState: CountryFlag.DISABLE,
                        onCountryChanged: (value) {
                          // retailerController.countryValue.value = value;
                        },
                        onStateChanged: (value) {
                          // retailerController.stateValue.value = value!;
                        },
                        onCityChanged: (value) {
                          // retailerController.cityValue.value = value!;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldCommon(
                        hintText: "Pin code",
                        controller: retailerController.pinCodeController,
                        validation: (pinCode) {
                          if (pinCode == "") {
                            return "Enter pin code";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      CheckTermCondition(
                        value: retailerController.isCheck.value,
                        onChanged: (value) {
                          retailerController.isCheck.value =
                          !retailerController.isCheck.value;
                        },
                      ),
                      CommonButton(
                        text: "Register",
                        onPressed: () {
                          if (retailerController.retailerRegKey.currentState!
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
