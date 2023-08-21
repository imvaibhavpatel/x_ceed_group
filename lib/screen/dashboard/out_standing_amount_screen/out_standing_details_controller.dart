import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xceed_group/screen/dashboard/out_standing_amount_screen/model/out_standing_details_model.dart';
import 'package:xceed_group/screen/dashboard/out_standing_amount_screen/out_standing_amount_screen.dart';
import 'package:http/http.dart' as http;
import 'package:xceed_group/utils/base_url.dart';

class OutStandingDetailsController extends GetxController {
  var box = GetStorage();
  ScrollController scrollController = ScrollController();

  RxInt page = 0.obs;
   RxInt selectedStatus = 0.obs;
  RxBool pageAvailableOrNot = true.obs;
  RxBool isLoading = false.obs;

  Rx<OutstandingStats> outStandingStatusData = OutstandingStats(
    accountName: '',
    totalOutstandingAmt: 0,
    totalInvoiceAmt: 0,
    totalDueAmount: 0,
    totalDueOutstandingPercentage: 0,
    totalOverdueAmount: 0,
    totalOverdueOutstandingPercentage: 0,
  ).obs;

  RxList<Datum> outStandingDetailsList = <Datum>[].obs;

  List<AmountData>? chartData;

  RxList<AmountData> getChartData() {
    final List<AmountData> chatData = [
      AmountData(
          "Due", outStandingStatusData.value.totalDueOutstandingPercentage),
      AmountData("Non Due",
          outStandingStatusData.value.totalOverdueOutstandingPercentage),
    ];
    return chatData.obs;
  }

  getOutstandingData({required bool isLoading,  int? selectedStatus }) async {
    isLoading = true;
    try {
      var userId = box.read("userId");
      var token = box.read("token");
      final response = await http.get(
          Uri.parse(
              "${AppUrl.baseUrl}${AppUrl.outStandingData}&logged_in_userid=$userId&page=${page.value}&limit=15"),
          headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        outStandingStatusData.value =
            outstandingDetailsModelFromJson(response.body).outstandingStats;
        outStandingDetailsList.addAll(
            outstandingDetailsModelFromJson(response.body)
                .outstandingsDetails
                .data);
        chartData = getChartData();
        if (outstandingDetailsModelFromJson(response.body)
                .outstandingsDetails
                .currentPage !=
            page.value) {
          page.value = page.value + 1;
        }
      } else {
        debugPrint("some error");
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading = false;
    }
  }

  scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getOutstandingData(isLoading: false );
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    scrollController.addListener(scrollListener);
    getOutstandingData(isLoading: false);
  }
}