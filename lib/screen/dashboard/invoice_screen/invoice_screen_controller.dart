import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:xceed_group/main.dart';
import 'package:xceed_group/screen/dashboard/invoice_screen/model/invoice_list_model.dart';
import 'package:xceed_group/utils/base_url.dart';

class InvoiceScreenController extends GetxController {
  TextEditingController searchCon = TextEditingController();
  ScrollController scrollController = ScrollController();

  RxInt invoiceID = 0.obs;
  RxInt page = 0.obs;
  RxString pages = "".obs;
  RxBool isLoading = false.obs;
  RxList<InvoiceList> invoiceListData = <InvoiceList>[].obs;

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
      invoiceListData.clear();
      getInvoiceList(
          startDate: dateRange.value.start.toString(),
          endDate: dateRange.value.end.toString(),
          loader: true);
    }
  }

  getInvoiceList(
      {String? startDate,
      String? endDate,
      bool? loader,
      String? search}) async {
    try {
      if (loader == true) {
        isLoading.value = true;
      } else {
        isLoading.value = false;
      }

      final response = await http.get(
          Uri.parse(
              "${AppUrl.baseUrl}${AppUrl.invoiceList}&logged_in_userid=${baseCon?.userid.value}&page=${page.value}&limit=15&date_range=${DateFormat('yyyy-MM-dd').format(dateRange.value.start)} - ${DateFormat('yyyy-MM-dd').format(dateRange.value.end)}&keyword=${searchCon.text.trim()}"),
          headers: {
            "Authorization": "Bearer ${baseCon?.token.value}",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        invoiceListData
            .addAll(invoiceListModelFromJson(response.body).result.data);
        if (invoiceListModelFromJson(response.body).result.currentPage !=
            page.value) {
          page.value = page.value + 1;
        }
      } else {
        debugPrint(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      getInvoiceList(
        startDate: dateRange.value.start.toString(),
        endDate: dateRange.value.end.toString(),
        loader: false,
      );
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    scrollController.addListener(scrollListener);
    getInvoiceList(
      startDate: dateRange.value.start.toString(),
      endDate: dateRange.value.end.toString(),
      loader: true,
    );
  }
}
