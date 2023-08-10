import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:xceed_group/auth/register_as_retailer/model/city_model.dart';
import 'package:xceed_group/auth/register_as_retailer/model/state_model.dart';
import 'package:xceed_group/utils/base_url.dart';

import 'model/countries_model.dart';

class RetailerController extends GetxController {
  final retailerRegKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController firmController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController registerRetEmailController = TextEditingController();
  TextEditingController gstNumController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  ImagePicker picker = ImagePicker();

  RxInt countryPage = 1.obs;
  RxInt cityPage = 1.obs;
  RxInt statePage = 1.obs;
  RxInt countryID = 0.obs;
  RxInt stateID = 0.obs;
  RxString selectedCountries = "".obs;
  RxString selectedState = "".obs;
  RxString selectedCity = "".obs;
  RxString adhaarDocPath = "".obs;
  RxString panDocPath = "".obs;
  RxString gstDocPath = "".obs;
  RxBool isCheck = false.obs;
  RxList<Country> countriesList = <Country>[].obs;
  RxList<StateName> stateList = <StateName>[].obs;
  RxList<City> cityList = <City>[].obs;

  getAdhaarDoc() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // adhaarImageController.value.text = image.name.toString();
      adhaarDocPath.value = image.name.toString();
    }
  }

  getPanCardDoc() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      panDocPath.value = image.name.toString();
    }
  }

  getGstDoc() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      gstDocPath.value = image.name.toString();
    }
  }

  getCountry() async {
    try {
      final response = await http.get(
        Uri.parse(
            "${BaseUrl.baseUrl}${BaseUrl.countriesUrl}page=${countryPage.value}&country_name="),
      );
      if (response.statusCode == 200) {
        countriesList.value += countriesModelFromJson(response.body).countries;
        if (countriesModelFromJson(response.body).totalPages !=
            countryPage.value) {
          countryPage.value = countryPage.value + 1;
          getCountry();
        }
      } else {
        debugPrint("some error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  getState(String countryID) async {
    try {
      final response = await http.get(Uri.parse(
          "${BaseUrl.baseUrl}${BaseUrl.stateURl}&country_id=$countryID&page=${statePage.value}&state_name="));
      if (response.statusCode == 200) {
        stateList.addAll(stateModelFromJson(response.body).states);
        if (stateModelFromJson(response.body).totalPages != statePage.value) {
          statePage.value = statePage.value + 1;
          getState(countryID);
        }
      } else {
        debugPrint("some error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  getCity(String stateID) async {
    try {
      final response = await http.get(Uri.parse(
          "${BaseUrl.baseUrl}${BaseUrl.cityUrl}&state_id=$stateID&page=${cityPage.value}&city_name="));
      if (response.statusCode == 200) {
        cityList.addAll(cityModelFromJson(response.body).cities);
        if (cityModelFromJson(response.body).totalPages != cityPage.value) {
          cityPage.value = cityPage.value + 1;
          getCity(stateID);
        }
      } else {
        debugPrint("some error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getCountry();
  }
}
