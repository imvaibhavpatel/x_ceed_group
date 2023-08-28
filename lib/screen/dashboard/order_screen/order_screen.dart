import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xceed_group/screen/dashboard/order_screen/order_screen_controller.dart';
import 'package:xceed_group/screen/dashboard/order_screen/widget/custom_tab_bar.dart';
import 'package:xceed_group/screen/dashboard/order_screen/widget/filter_page.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/utils/icons.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class OrderScreen extends StatelessWidget {
  final OrderScreenController orderScreenController =
      Get.put(OrderScreenController());

  OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTabBar(
                  tabText: "Purchase Order",
                  color: orderScreenController.tab.value == 1
                      ? Colors.red
                      : Colors.grey,
                  underLine: orderScreenController.tab.value == 1
                      ? AppColor.appColor
                      : Colors.grey.shade200,
                  onTap: () {
                    orderScreenController.tab.value = 1;
                  },
                ),
                CustomTabBar(
                  tabText: "Sales Order",
                  color: orderScreenController.tab.value == 2
                      ? Colors.red
                      : Colors.grey,
                  underLine: orderScreenController.tab.value == 2
                      ? AppColor.appColor
                      : Colors.grey.shade200,
                  onTap: () {
                    orderScreenController.tab.value = 2;
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => orderScreenController.isLoading.value
                ? const CircularProgressIndicator(color: Colors.blue)
                : Expanded(
                    child: SingleChildScrollView(
                      controller: orderScreenController.scrollController,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.outer,
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    orderScreenController.selectDateRang();
                                  },
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        SvgIcons.calendarIcon,
                                        // ignore: deprecated_member_use
                                        color: Colors.grey.shade600,
                                      ),
                                      Text(
                                        "${DateFormat("dd MMM").format(orderScreenController.dateRange.value.start).toString()} - ${DateFormat("dd MMM").format(orderScreenController.dateRange.value.end).toString()}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(FilterPage(),
                                      transition: Transition.downToUp,
                                      duration:
                                          const Duration(milliseconds: 50)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppIcons.filter,
                                        height: 18,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        "Filter",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: orderScreenController.orderList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // orderScreenController.invoiceID.value =
                                  //     orderScreenController
                                  //         .orderScreenController[index]
                                  //         .invoiceId;
                                  //
                                  // Get.to(() => orderScreenController(),
                                  //     arguments: [
                                  //       orderScreenController
                                  //           .invoiceListData[index].invoiceId,
                                  //       orderScreenController
                                  //           .invoiceListData[index]
                                  //     ]);
                                },
                                child: Card(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 13,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.blue.shade900,
                                          ),
                                          child: const Text(
                                            "Or",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Order #${orderScreenController.orderList[index].orderId}",
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Qty: ${orderScreenController.orderList[index].totalOrderQty}",
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "Amt: \u{20B9}${orderScreenController.orderList[index].amount?.toStringAsFixed(2)}",
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontSize: 13,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 5,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                ),
                                              ),
                                              child: Text(
                                                orderScreenController
                                                    .orderList[index].status
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: orderScreenController
                                                              .orderList[index]
                                                              .status
                                                              .toString() ==
                                                          "Placed"
                                                      ? Colors.green
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              DateFormat("dd MMM yyy").format(
                                                  orderScreenController
                                                      .orderList[index]
                                                      .createdAt as DateTime),
                                              style: const TextStyle(
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
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
