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
                  color: Colors.black,
                )
              ],
            ),
          ),
          Obx(
            () => outStandingDetailsController.isLoading.value
                ? const CircularProgressIndicator(
                    color: Colors.blue,
                  )
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
                                          fontWeight: FontWeight.bold),
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
                                PopupMenuButton(
                                  position: PopupMenuPosition.under,
                                  // onSelected: (value) {
                                  //   outStandingDetailsController
                                  //       .selectedStatus.value = value;
                                  // },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 0,
                                      onTap: () {

                                        // outStandingDetailsController
                                        //     .page.value = 0;
                                        // outStandingDetailsController
                                        //     .getOutstandingData(
                                        //         isLoading: true,
                                        //         selectedStatus:
                                        //             outStandingDetailsController
                                        //                 .selectedStatus.value);
                                      },
                                      child: Text(
                                        "Due",
                                        style: TextStyle(
                                          color: Colors.indigo.shade900,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 1,
                                      onTap: () {
                                        // outStandingDetailsController
                                        //     .page.value = 0;
                                        // outStandingDetailsController
                                        //     .getOutstandingData(
                                        //         isLoading: true,
                                        //         selectedStatus:
                                        //             outStandingDetailsController
                                        //                 .selectedStatus.value);
                                      },
                                      child: Text(
                                        "Non Due",
                                        style: TextStyle(
                                          color: Colors.indigo.shade900,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Select Status",
                                          style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: Colors.indigo.shade900,
                                        )
                                      ],
                                    ),
                                  ),
                                )
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
                                ),
                                const Spacer(),
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
                                )
                              ],
                            ),
                          ),
                          SfCircularChart(
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
