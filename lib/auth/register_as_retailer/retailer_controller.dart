  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:image_picker/image_picker.dart';
  import 'package:http/http.dart' as http;
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
    TextEditingController adhaarImageController = TextEditingController();
    TextEditingController panImageController = TextEditingController();
    TextEditingController gstImageController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController searchController = TextEditingController();
    ImagePicker picker = ImagePicker();

    RxInt page = 1.obs;
    RxInt countryID = 0.obs;
    RxString selectedCountries = "".obs;
    RxBool isCheck = false.obs;
    RxList<Country> countriesList = <Country>[].obs;

    getAdhaarDoc() async {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        adhaarImageController.text = image.name.toString();
      }
    }

    getPanCardDoc() async {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        panImageController.text = image.name.toString();
      }
    }

    getGstDoc() async {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        gstImageController.text = image.name.toString();
      }
    }

    getCountry() async {
      try {
        final response = await http.get(
          Uri.parse(
              "${BaseUrl.baseUrl}${BaseUrl.countriesUrl}page=${page.value}&country_name="),
        );
        if (response.statusCode == 200) {
          countriesList.value += countriesModelFromJson(response.body).countries;
          if (countriesModelFromJson(response.body).totalPages != page.value) {
            page.value = page.value + 1;
            getCountry();
          }
        } else {
          debugPrint("some error");
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    getState() async {
      try {
        final response = await http.get(Uri.parse(
            "${BaseUrl.baseUrl}${BaseUrl.stateURl}&country_id=$countryID&page=$page&state_name="));
        if (response.statusCode == 200) {
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
      getState();
    }
  }
