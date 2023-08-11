import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/model/city_model.dart';
import 'package:xceed_group/auth/model/countries_model.dart';
import 'package:xceed_group/auth/model/state_model.dart';
import 'package:xceed_group/auth/register_as_distributor/distributor_controller.dart';
import 'package:xceed_group/auth/widget/check_terms_condition.dart';
import 'package:xceed_group/auth/widget/city_drop_down.dart';
import 'package:xceed_group/auth/widget/country_drop_down.dart';
import 'package:xceed_group/auth/widget/doc_image_container.dart';
import 'package:xceed_group/auth/widget/heading_container.dart';
import 'package:xceed_group/auth/widget/comman_text_field.dart';
import 'package:xceed_group/auth/widget/state_drop_down.dart';
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
                      DocImageContainer(
                        text: distributorController
                                .disAdhaarDocPath.value.isNotEmpty
                            ? distributorController.disAdhaarDocPath.value
                            : "Attach Adhaar card Doc*",
                        textColor: distributorController
                                .disAdhaarDocPath.value.isNotEmpty
                            ? Colors.black
                            : Colors.grey.shade700,
                        onTap: () => distributorController.getAdhaarDoc(),
                        checkColor: distributorController
                                .disAdhaarDocPath.value.isNotEmpty
                            ? Colors.green
                            : Colors.grey.shade300,
                      ),
                      const SizedBox(height: 10),
                      DocImageContainer(
                        text:
                            distributorController.disPanDocPath.value.isNotEmpty
                                ? distributorController.disPanDocPath.value
                                : "Attach Pan card Doc*",
                        textColor:
                            distributorController.disPanDocPath.value.isNotEmpty
                                ? Colors.black
                                : Colors.grey.shade700,
                        onTap: () => distributorController.getPanCardDoc(),
                        checkColor:
                            distributorController.disPanDocPath.value.isNotEmpty
                                ? Colors.green
                                : Colors.grey.shade300,
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
                      DocImageContainer(
                        text:
                            distributorController.disGstDocPath.value.isNotEmpty
                                ? distributorController.disGstDocPath.value
                                : "Attach GST Doc*",
                        onTap: () => distributorController.getGstDoc(),
                        textColor:
                            distributorController.disGstDocPath.value.isNotEmpty
                                ? Colors.black
                                : Colors.grey.shade700,
                        checkColor:
                            distributorController.disGstDocPath.value.isNotEmpty
                                ? Colors.green
                                : Colors.grey.shade300,
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
                      CountryDropDown(
                        items: distributorController.countriesList,
                        itemAsString: (Country country) => country.name,
                        onChanged: (Country? country) async {
                          distributorController.selectedCountries.value =
                              country!.name.toString();
                          distributorController.countryID.value = country.id;
                          distributorController.stateList.clear();
                          distributorController.statePage.value = 1;
                          await distributorController.getState(
                              distributorController.countryID.value.toString());
                        },
                      ),
                      const SizedBox(height: 10),
                      StateDropDown(
                        items: distributorController.stateList,
                        itemAsString: (StateName state) => state.name,
                        onChanged: (StateName? state) async {
                          distributorController.selectedState.value =
                              state!.name.toString();
                          distributorController.stateID.value = state.id;
                          distributorController.cityList.clear();
                          distributorController.cityPage.value = 1;
                          await distributorController.getCity(
                              distributorController.stateID.value.toString());
                        },
                      ),
                      const SizedBox(height: 10),
                      CityDropDown(
                          items: distributorController.cityList,
                          itemAsString: (City city) => city.name,
                          onChanged: (City? city) async {
                            distributorController.selectedCity.value =
                                city!.name.toString();
                          }),
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
                              .validate()) {
                            FocusScope.of(context).unfocus();
                          }
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
