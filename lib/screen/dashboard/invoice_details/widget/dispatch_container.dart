import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/invoice_details_controller.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/invoice_details_screen.dart';

class DispatchContainer extends StatelessWidget {
  final InvoiceDetailsController invDetailsController =
      Get.put(InvoiceDetailsController());

  DispatchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        invDetailsController.invoiceData.value.invoiceDispatchDetails == null
            ? const CommonText(text: "No Details Found")
            : const Text("Loading")
      ],
    );
  }
}
