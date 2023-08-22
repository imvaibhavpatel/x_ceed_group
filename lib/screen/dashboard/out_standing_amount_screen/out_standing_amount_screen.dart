import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xceed_group/screen/dashboard/out_standing_amount_screen/out_standing_details_controller.dart';
import 'package:xceed_group/screen/dashboard/out_standing_amount_screen/widget/list_text_style.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class OutStandingAmountScreen extends StatelessWidget {
  final OutStandingDetailsController outStandingDetailsController =
      Get.put(OutStandingDetailsController());

  OutStandingAmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_outlined),
                ),
                const SizedBox(width: 30),
                const Text(
                  "XCUT UNITY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  SvgIcons.shoppingCartIcon,
                  // ignore: deprecated_member_use
                  color: Colors.black,
                )
              ],
            ),
          ),
          Obx(
            () => outStandingDetailsController.isLoading.value
                ? const CircularProgressIndicator(color: Colors.blue)
                : Expanded(
                    child: SingleChildScrollView(
                      controller: outStandingDetailsController.scrollController,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            color: Colors.indigo.withOpacity(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Your Outstanding",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      outStandingDetailsController
                                          .outStandingStatusData
                                          .value
                                          .totalOutstandingAmt
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.indigo.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: Get.width * 0.40,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.shade100,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: DropdownButton(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      hint: const Text("Select Status"),
                                      value: outStandingDetailsController
                                              .dropDownValue.value.isEmpty
                                          ? null
                                          : outStandingDetailsController
                                              .dropDownValue.value,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.indigo.shade900,
                                      ),
                                      underline: const SizedBox(),
                                      items: outStandingDetailsController.status
                                          .map((items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        if (value != null) {
                                          outStandingDetailsController
                                              .dropDownValue.value = value;
                                          outStandingDetailsController
                                              .page.value = 0;
                                          outStandingDetailsController
                                              .outStandingDetailsList
                                              .clear();
                                          outStandingDetailsController
                                              .getOutstandingData(
                                                  showLoader: true,
                                                  selectedStatus:
                                                      outStandingDetailsController
                                                          .dropDownValue.value);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.square,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Rs. ${outStandingDetailsController.outStandingStatusData.value.totalDueAmount.toString()}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.square,
                                  color: Colors.greenAccent,
                                  size: 15,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Rs. ${outStandingDetailsController.outStandingStatusData.value.totalOverdueAmount.toString()}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SfCircularChart(
                            // tooltipBehavior: TooltipBehavior(),
                            palette: [
                              Colors.red.shade400,
                              Colors.greenAccent.shade400
                            ],
                            series: <CircularSeries>[
                              PieSeries<AmountData, String>(
                                dataSource:
                                    outStandingDetailsController.chartData,
                                xValueMapper: (AmountData data, _) =>
                                    data.amountType,
                                yValueMapper: (AmountData data, _) =>
                                    data.amount,
                                dataLabelMapper: (AmountData data, _) =>
                                    "${data.amountType}\n${data.amount}%",
                                dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Your Outstanding",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Obx(
                            () => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: outStandingDetailsController
                                  .outStandingDetailsList.length,
                              itemBuilder: (context, index) {
                                return ListTextStyle(
                                  date: DateFormat("dd MMM yyy").format(
                                      outStandingDetailsController
                                          .outStandingDetailsList[index]
                                          .invoiceDate),
                                  invoiceNo:
                                      "Invoice #${outStandingDetailsController.outStandingDetailsList[index].invoiceId.toString()}",
                                  dueDate:
                                      "Due Date :${DateFormat("dd MMM yyy").format(outStandingDetailsController.outStandingDetailsList[index].paymentDueDate)}",
                                  dueAmt: outStandingDetailsController
                                      .outStandingDetailsList[index]
                                      .outstandingAmt
                                      .toString(),
                                  status: outStandingDetailsController
                                      .outStandingDetailsList[index]
                                      .outstandingStatus
                                      .toString(),
                                  color: outStandingDetailsController
                                              .outStandingDetailsList[index]
                                              .outstandingStatus
                                              .toString() ==
                                          "due"
                                      ? Colors.redAccent.shade100
                                          .withOpacity(0.3)
                                      : Colors.grey.shade400,
                                  textColor: outStandingDetailsController
                                              .outStandingDetailsList[index]
                                              .outstandingStatus
                                              .toString() ==
                                          "due"
                                      ? Colors.redAccent
                                      : Colors.black,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class AmountData {
  AmountData(
    this.amountType,
    this.amount,
  );

  final String amountType;
  final double amount;
}
