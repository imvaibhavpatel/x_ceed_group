import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xceed_group/main.dart';
import 'package:xceed_group/screen/dashboard/home/model/banner_details_model.dart';
import 'package:xceed_group/screen/dashboard/home/model/home_details_model.dart';
import 'package:xceed_group/utils/base_url.dart';

class HomeController extends GetxController {
  var box = GetStorage();

  RxInt currentPage = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isBannerLoad = false.obs;

  RxList<Banner2> bannerData = <Banner2>[].obs;

  Rx<Analytics> analyticsHomeDetails = Rx<Analytics>(Analytics(
    bookingAmount: 0,
    invoiceAmount: 0,
    pendingAmount: 0,
    totalOutstandingAmount: 0,
    creditLimitAmount: 0,
    paymentDoneAmount: 0,
  ));

  var dateRange = DateTimeRange(
    start: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 30),
    end: DateTime.now(),
  ).obs;

  selectDateRang() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year + 20),
      initialDateRange: dateRange.value,
    );
    if (picked != null && picked != dateRange.value) {
      dateRange.value = picked;
      getHomeDetails(
          startDate: dateRange.value.start.toString(),
          endDate: dateRange.value.end.toString());
    }
  }

  getHomeDetails({required String startDate, required String endDate}) async {
    isLoading.value = true;
    try {
      var userId = box.read("userId");
      var token = box.read("token");
      final response = await http.get(
          Uri.parse(
              '${AppUrl.baseUrl}${AppUrl.homeAnalytics}&logged_in_userid=$userId&date_range=${DateFormat('yyyy-MM-dd').format(dateRange.value.start).toString()} - ${DateFormat('yyyy-MM-dd').format(dateRange.value.end).toString()}'),
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        analyticsHomeDetails.value =
            homeDetailsModelFromJson(response.body).analytics;
      } else {
        debugPrint("JSON data is not in the expected format");
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  getBanner() async {
    isLoading.value = true;
    try {
      var userId = box.read("userId");
      var token = box.read("token");
      final response = await http.get(
          Uri.parse(
              "https://beta-ow-api-v3.salestrendz.com/api/banners/bannerdetails?comp_id=749&logged_in_userid=$userId"),
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        bannerData.value = bannerDetailsModelFromJson(response.body)
            .bannerDetails
            .banner150X150;
        print(token);
        print(baseController?.token.value);
      } else {
        debugPrint("some error");
      }
    } catch (e) {
      throw Exception(e..toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getHomeDetails(
        startDate: dateRange.value.start.toString(),
        endDate: dateRange.value.end.toString());
    getBanner();
  }
}
