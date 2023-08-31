import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xceed_group/main.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/model/invoice_detail_model.dart';
import 'package:xceed_group/utils/base_url.dart';

class InvoiceDetailsController extends GetxController {
  RxInt invoiceId = 0.obs;
  RxBool isLoading = false.obs;
  Rx<InvoiceDetailModel> invoiceData = InvoiceDetailModel().obs;

  getInvoiceDetails() async {
    isLoading.value = true;
    try {
      final response = await http.get(
          Uri.parse(
              "${AppUrl.baseUrl}${AppUrl.invoiceDetails}&logged_in_userid=${baseCon?.userid.value}&invoice_id=$invoiceId"),
          headers: {
            "Authorization": "Bearer ${baseCon?.token.value}",
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });
      if (response.statusCode == 200) {
        invoiceData.value = invoiceDetailModelFromJson(response.body);
      } else {
        debugPrint(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getInvoiceDetails();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments != null) {
      invoiceId.value = Get.arguments[0];
    }
  }
}
