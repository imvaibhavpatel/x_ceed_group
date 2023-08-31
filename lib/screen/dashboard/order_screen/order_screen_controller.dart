import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xceed_group/main.dart';
import 'package:xceed_group/screen/dashboard/order_screen/model/order_list_model.dart';
import 'package:xceed_group/utils/base_url.dart';
import 'package:http/http.dart' as http;

class OrderScreenController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxInt tab = 1.obs;
  RxInt page = 0.obs;

  RxBool isLoading = false.obs;
  RxBool placed = false.obs;
  RxBool cancelled = false.obs;
  RxBool partSupplied = false.obs;
  RxBool supplied = false.obs;
  RxBool confirmed = false.obs;
  RxBool ordDispatch = false.obs;
  RxBool rejected = false.obs;

  RxList switchValue = [].obs;
  RxList<String> value = <String>[].obs;
  RxList<OrderList> orderList = <OrderList>[].obs;

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
      page.value = 0;
      orderList.clear();
      getOrderList(
        startDate: dateRange.value.start.toString(),
        endDate: dateRange.value.end.toString(),
        loader: true,
      );
    }
  }

  getOrderList(
      {String? startDate,
      String? endDate,
      bool? loader,
      dynamic status}) async {
    if (loader == true) {
      isLoading.value = true;
    } else {
      isLoading.value = false;
    }
    try {
      final response = await http.get(
        Uri.parse(
            "${AppUrl.orderList}logged_in_userid=${baseCon?.userid.value}&page=${page.value}&order_id=&status=${switchValue.join(",")}&date_range=${DateFormat('yyyy-MM-dd').format(dateRange.value.start).toString()} - ${DateFormat('yyyy-MM-dd').format(dateRange.value.end).toString()}"),
        headers: {
          "Authorization": "Bearer ${baseCon?.token.value}",
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        orderList.addAll(orderListModelFromJson(response.body).orderList);
        // ignore: unrelated_type_equality_checks
        if (orderListModelFromJson(response.body).page != page.value) {
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
      getOrderList(
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
    getOrderList(loader: false);
  }
}
