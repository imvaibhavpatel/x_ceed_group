import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/invoice_details_controller.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/widget/amount_details_data.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/widget/common_column.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/widget/dispatch_container.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/widget/product_details_container.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  final InvoiceDetailsController invDetailsController =
      Get.put(InvoiceDetailsController());

  InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
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
                  "Invoice Details",
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
            () => invDetailsController.isLoading.value || invDetailsController.invoiceData.value.invoiceDetails == null
                ? const CircularProgressIndicator(color: Colors.blue)
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: Get.width,
                            color: const Color(0XFF1512B2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Invoice ID #${invDetailsController.invoiceData.value.invoiceDetails?.invoiceSourceId.toString()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.bottomSheet(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25),
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      DispatchContainer(),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: const Text(
                                      "DISPATCH",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            color: Colors.white.withOpacity(0.6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonColumn(
                                  text: "Invoice Date",
                                  subText: DateFormat("dd-MMM-yyy").format(
                                      invDetailsController.invoiceData.value
                                          .invoiceDetails!.invoiceDate),
                                ),
                                const SizedBox(height: 5),
                                CommonColumn(
                                  text: "Invoice Total",
                                  subText:
                                      "\u{20B9}${invDetailsController.invoiceData.value.invoiceDetails?.totalAmount.toString()}",
                                ),
                              ],
                            ),
                          ),
                          const CommonText(text: "Order Particular"),
                          const ScreenDivider(),
                          const SizedBox(height: 5),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: invDetailsController.invoiceData.value
                                .invoiceDetails!.invoiceMeta.length,
                            itemBuilder: (context, index) {
                              return ProductDetailsContainer(
                                proName: invDetailsController
                                    .invoiceData
                                    .value
                                    .invoiceDetails!
                                    .invoiceMeta[index]
                                    .productName,
                                proQty: invDetailsController.invoiceData.value
                                    .invoiceDetails!.invoiceMeta[index].qty
                                    .toString(),
                                proRate: invDetailsController
                                    .invoiceData
                                    .value
                                    .invoiceDetails
                                    ?.invoiceMeta[index]
                                    .prodPrice
                                    .toString(),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const ScreenDivider();
                            },
                          ),
                          const ScreenDivider(),
                          const SizedBox(height: 10),
                          const CommonText(text: "Payment Details"),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            color: Colors.white.withOpacity(0.6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Billing Address"),
                                const SizedBox(height: 5),
                                Text(
                                  invDetailsController.invoiceData.value
                                      .invoiceDetails!.billingAddress
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const ScreenDivider(start: 0, end: 0),
                                const SizedBox(height: 10),
                                const Text("Comments"),
                                const SizedBox(height: 5),
                                Text(
                                  invDetailsController.invoiceData.value
                                      .invoiceDetails!.comments
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          const CommonText(text: "Shipping Details"),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            color: Colors.white.withOpacity(0.6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Shipping Address"),
                                const SizedBox(height: 5),
                                Text(
                                  invDetailsController.invoiceData.value
                                      .invoiceDetails!.shippingAddress
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const ScreenDivider(end: 0, start: 0),
                                const SizedBox(height: 10),
                                const Text("Expected Delivery Date"),
                                const SizedBox(height: 5),
                                Text(
                                  // "October 02,2023",
                                  DateFormat("MMMM dd,yyy").format(
                                    invDetailsController.invoiceData.value
                                        .invoiceDetails!.expectedDeliveryDate,
                                  ),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                          const CommonText(text: "Amount Details"),
                          Container(
                            color: Colors.white.withOpacity(0.6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Column(
                              children: [
                                AmountDetailsData(
                                  text: "Product",
                                  textValue: invDetailsController.invoiceData
                                      .value.invoiceDetails!.orderedProductCount
                                      .toString(),
                                ),
                                AmountDetailsData(
                                  text: "Total Order Qty",
                                  textValue: invDetailsController
                                      .invoiceData
                                      .value
                                      .invoiceDetails!
                                      .orderedProductTotalQty
                                      .toString(),
                                ),
                                AmountDetailsData(
                                  text: "Total before Tax",
                                  textValue: invDetailsController
                                      .invoiceData
                                      .value
                                      .invoiceDetails!
                                      .beforeGstAdditionAmount
                                      .toString(),
                                ),
                                AmountDetailsData(
                                  text: "Tax",
                                  textValue: invDetailsController.invoiceData
                                      .value.invoiceDetails!.totalgstAmount
                                      .toString(),
                                ),
                                AmountDetailsData(
                                  text: "Discount",
                                  textValue: invDetailsController
                                      .invoiceData
                                      .value
                                      .invoiceDetails!
                                      .generalDiscountAmount
                                      .toString(),
                                ),
                                AmountDetailsData(
                                  text: "Scheme Discount",
                                  textValue: invDetailsController
                                      .invoiceData
                                      .value
                                      .invoiceDetails!
                                      .schemeDiscountAmount
                                      .toString(),
                                ),
                                AmountDetailsData(
                                  text: "Total",
                                  textValue: invDetailsController.invoiceData
                                      .value.invoiceDetails!.totalAmount
                                      .toString(),
                                ),
                                AmountDetailsData(
                                  text: "Order Total",
                                  textValue: invDetailsController.invoiceData
                                      .value.invoiceDetails!.totalAmount
                                      .toString(),
                                  color: Colors.indigo.shade900,
                                  fontSize: 18,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
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

class CommonText extends StatelessWidget {
  final String? text;

  const CommonText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        text!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class ScreenDivider extends StatelessWidget {
  final double? end;
  final double? start;

  const ScreenDivider({
    super.key,
    this.end,
    this.start,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      endIndent: end ?? 20,
      indent: start ?? 20,
      height: 0,
    );
  }
}
