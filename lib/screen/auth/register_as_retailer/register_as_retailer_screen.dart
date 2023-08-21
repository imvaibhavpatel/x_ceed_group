import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/auth/model/city_model.dart';
import 'package:xceed_group/screen/auth/model/countries_model.dart';
import 'package:xceed_group/screen/auth/model/state_model.dart';
import 'package:xceed_group/screen/auth/register_as_retailer/retailer_controller.dart';
import 'package:xceed_group/screen/auth/widget/check_terms_condition.dart';
import 'package:xceed_group/screen/auth/widget/city_drop_down.dart';
import 'package:xceed_group/screen/auth/widget/comman_text_field.dart';
import 'package:xceed_group/screen/auth/widget/country_drop_down.dart';
import 'package:xceed_group/screen/auth/widget/doc_image_container.dart';
import 'package:xceed_group/screen/auth/widget/heading_container.dart';
import 'package:xceed_group/screen/auth/widget/state_drop_down.dart';
import 'package:xceed_group/utils/common_button.dart';


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
                      DocImageContainer(
                        text: retailerController.adhaarDocPath.value.isNotEmpty
                            ? retailerController.adhaarDocPath.value
                            : "Attach Adhaar card Doc*",
                        textColor:
                            retailerController.adhaarDocPath.value.isNotEmpty
                                ? Colors.black
                                : Colors.grey.shade700,
                        onTap: () => retailerController.getAdhaarDoc(),
                        checkColor:
                            retailerController.adhaarDocPath.value.isNotEmpty
                                ? Colors.green
                                : Colors.grey.shade300,
                      ),
                      const SizedBox(height: 10),
                      DocImageContainer(
                        text: retailerController.panDocPath.value.isNotEmpty
                            ? retailerController.panDocPath.value
                            : "Attach Pan card Doc*",
                        textColor:
                        retailerController.panDocPath.value.isNotEmpty
                            ? Colors.black
                            : Colors.grey.shade700,
                        onTap: () => retailerController.getPanCardDoc(),
                        checkColor:
                            retailerController.panDocPath.value.isNotEmpty
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
                        controller: retailerController.gstNumController,
                        validation: (gstNum) {
                          if (gstNum == "") {
                            return "Enter GST number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DocImageContainer(
                        text: retailerController.gstDocPath.value.isNotEmpty
                            ? retailerController.gstDocPath.value
                            : "Attach GST Doc*",
                        textColor:
                        retailerController.gstDocPath.value.isNotEmpty
                            ? Colors.black
                            : Colors.grey.shade600,
                        onTap: () => retailerController.getGstDoc(),
                        checkColor:
                            retailerController.gstDocPath.value.isNotEmpty
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
                      CountryDropDown(
                        items: retailerController.countriesList,
                        itemAsString: (Country country) => country.name,
                        onChanged: (Country? country) async {
                          retailerController.selectedCountries.value =
                              country!.name.toString();
                          retailerController.countryID.value = country.id;
                          retailerController.stateList.clear();
                          retailerController.statePage.value = 1;
                          await retailerController.getState(
                              retailerController.countryID.value.toString());
                        },
                      ),
                      const SizedBox(height: 10),
                      StateDropDown(
                        items: retailerController.stateList,
                        itemAsString: (StateName state) => state.name,
                        onChanged: (StateName? state) async {
                          retailerController.selectedState.value =
                              state!.name.toString();
                          retailerController.stateID.value = state.id;
                          retailerController.cityList.clear();
                          retailerController.cityPage.value = 1;
                          await retailerController.getCity(
                              retailerController.stateID.value.toString());
                        },
                      ),
                      const SizedBox(height: 10),
                      CityDropDown(
                          items: retailerController.cityList,
                          itemAsString: (City city) => city.name,
                          onChanged: (City? city) async {
                            retailerController.selectedCity.value =
                                city!.name.toString();
                          }),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      DropdownSearch<Country>(
                        dropdownButtonProps: const DropdownButtonProps(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.grey,
                            )),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              filled: true,
                              hintText: "Country",
                              fillColor: Colors.grey.shade200,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        items: retailerController.countriesList,
                        popupProps: const PopupProps.dialog(
                          showSearchBox: true,
                          showSelectedItems: false,
                        ),
                        itemAsString: (Country country) => country.name,
                        onChanged: (Country? country) {
                          retailerController.selectedCountries.value =
                              country!.name.toString();
                          retailerController.countryID.value = country.id;
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
