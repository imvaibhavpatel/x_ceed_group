import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xceed_group/screen/dashboard/invoice_details/invoice_details_screen.dart';
import 'package:xceed_group/screen/dashboard/invoice_screen/invoice_screen_controller.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class InvoiceScreen extends StatelessWidget {
  final InvoiceScreenController invoiceScreenController =
      Get.put(InvoiceScreenController());

  InvoiceScreen({super.key});

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
                const Text(
                  "Invoices",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: Get.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: invoiceScreenController.searchCon,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Search",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(SvgIcons.searchIcons),
                          ),
                        ),
                        onSubmitted: (value) {
                          invoiceScreenController.searchCon.text = value;
                          invoiceScreenController.invoiceListData.clear();
                          invoiceScreenController.page.value = 0;
                          invoiceScreenController.getInvoiceList(
                              search: invoiceScreenController.searchCon.text
                                  .toString()
                                  .trim());
                        },
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    invoiceScreenController.selectDateRang();
                    invoiceScreenController.invoiceListData.clear();
                    invoiceScreenController.page.value = 0;
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0XFF1929BF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset(
                      SvgIcons.calendarIcon,
                      height: 35,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => invoiceScreenController.isLoading.value
                ? const CircularProgressIndicator()
                : Expanded(
                    child: SingleChildScrollView(
                      controller: invoiceScreenController.scrollController,
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount:
                                invoiceScreenController.invoiceListData.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  invoiceScreenController.invoiceID.value =
                                      invoiceScreenController
                                          .invoiceListData[index].invoiceId;

                                  Get.to(() => InvoiceDetailsScreen(),
                                      arguments: [
                                        invoiceScreenController
                                            .invoiceListData[index].invoiceId,
                                        invoiceScreenController.invoiceListData[index]
                                      ]);
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
                                            "IN",
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
                                                "Invoice #${invoiceScreenController.invoiceListData[index].invoiceSourceId}"),
                                            Row(
                                              children: [
                                                Text(
                                                  "Qty: ${invoiceScreenController.invoiceListData[index].orderedProductTotalQty}",
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.6),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  "Amt: \u{20B9}${invoiceScreenController.invoiceListData[index].totalAmount}",
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
                                                horizontal: 25,
                                                vertical: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                ),
                                              ),
                                              child: Text(
                                                invoiceScreenController
                                                    .invoiceListData[index]
                                                    .status,
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              DateFormat("dd MMM yyy").format(
                                                  invoiceScreenController
                                                      .invoiceListData[index]
                                                      .invoiceDate),
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
