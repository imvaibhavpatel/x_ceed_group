import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/register_as_retailer/model/countries_model.dart';
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
                      // DropdownButton2(
                      //   isExpanded: true,
                      //   isDense: false,
                      //   value: retailerController.selectedCountries.value,
                      //   hint: const Text("Country"),
                      //   iconStyleData: const IconStyleData(
                      //     icon: Icon(Icons.keyboard_arrow_down_sharp),
                      //   ),
                      //   dropdownStyleData: DropdownStyleData(
                      //     maxHeight: Get.height * 0.60,
                      //     elevation: 0,
                      //   ),
                      //   //dropdownSearchData: DropdownSearchData(
                      //   //   searchInnerWidgetHeight: 30,
                      //   //   searchController: retailerController.searchController,
                      //   //   searchInnerWidget: Padding(
                      //   //     padding: const EdgeInsets.symmetric(
                      //   //       horizontal: 15,
                      //   //       vertical: 10,
                      //   //     ),
                      //   //     child: TextFormField(
                      //   //       controller: retailerController.searchController,
                      //   //     ),
                      //   //   ),
                      //   //   searchMatchFn: (item, search) {
                      //   //     return item.value!.name
                      //   //         .toString()
                      //   //         .toLowerCase()
                      //   //         .contains(search.toLowerCase());
                      //   //   },
                      //   // ),
                      //   onMenuStateChange: (isOpen) {
                      //     if (!isOpen) {
                      //       retailerController.searchController.clear();
                      //     }
                      //   },
                      //   items: retailerController.countriesList
                      //       .map(
                      //         (Country item) => DropdownMenuItem<Country>(
                      //           value: item,
                      //           child: Text(item.name.toString()),
                      //         ),
                      //       )
                      //       .toList(),
                      //   onChanged: (value) {
                      //     retailerController.selectedCountries.value =
                      //         value.toString();
                      //     print(retailerController.selectedCountries.value
                      //         .toString());
                      //   },
                      // ),
                      const SizedBox(height: 10),
                      DropdownSearch<Country>(
                        dropdownButtonProps: DropdownButtonProps(
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
                              focusedBorder: UnderlineInputBorder(
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
                          print(retailerController.countryID.value);
                          print(country.name.toString());
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
