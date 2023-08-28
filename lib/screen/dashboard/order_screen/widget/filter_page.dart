import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/order_screen/order_screen_controller.dart';
import 'package:xceed_group/utils/app_color.dart';

class FilterPage extends StatelessWidget {
  final OrderScreenController orderScreenController =
      Get.put(OrderScreenController());

  FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Select Filter",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 5),
            child: TextButton(
              onPressed: () {
                orderScreenController.placed.value = false;
                orderScreenController.cancelled.value = false;
                orderScreenController.partSupplied.value = false;
                orderScreenController.supplied.value = false;
                orderScreenController.confirmed.value = false;
                orderScreenController.ordDispatch.value = false;
                orderScreenController.rejected.value = false;
                orderScreenController.switchValue.clear();
              },
              child: Text(
                "Reset to Default",
                style: TextStyle(
                  color: AppColor.appColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            const SizedBox(height: 20),
            SwitchText(
              text: "Placed",
              color: orderScreenController.placed.value
                  ? AppColor.appColor
                  : Colors.grey.shade300,
              alignment: orderScreenController.placed.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              onTap: () {
                var placed = "Placed";
                orderScreenController.placed.value =
                    !orderScreenController.placed.value;
                if (orderScreenController.placed.value) {
                  orderScreenController.switchValue.add(placed.toString());
                } else {
                  orderScreenController.switchValue.remove(placed);
                }
              },
            ),
            Divider(color: Colors.grey.shade400),
            SwitchText(
              text: "Cancelled",
              color: orderScreenController.cancelled.value
                  ? AppColor.appColor
                  : Colors.grey.shade300,
              alignment: orderScreenController.cancelled.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              onTap: () {
                var cancel = "Cancelled";
                orderScreenController.cancelled.value =
                    !orderScreenController.cancelled.value;
                if (orderScreenController.cancelled.value) {
                  orderScreenController.switchValue.add(cancel.toString());
                } else {
                  orderScreenController.switchValue.remove(cancel);
                }
              },
            ),
            Divider(color: Colors.grey.shade400),
            SwitchText(
              text: "Part Supplied",
              color: orderScreenController.partSupplied.value
                  ? AppColor.appColor
                  : Colors.grey.shade300,
              alignment: orderScreenController.partSupplied.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              onTap: () {
                var prtSupplied = "Part Supplied";
                orderScreenController.partSupplied.value =
                    !orderScreenController.partSupplied.value;
                if (orderScreenController.partSupplied.value) {
                  orderScreenController.switchValue.add(prtSupplied.toString());
                } else {
                  orderScreenController.switchValue.remove(prtSupplied);
                }
              },
            ),
            Divider(color: Colors.grey.shade400),
            SwitchText(
              text: "Supplied",
              color: orderScreenController.supplied.value
                  ? AppColor.appColor
                  : Colors.grey.shade300,
              alignment: orderScreenController.supplied.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              onTap: () {
                var supplies = "Supplied";
                orderScreenController.supplied.value =
                    !orderScreenController.supplied.value;
                if (orderScreenController.supplied.value) {
                  orderScreenController.switchValue.add(supplies.toString());
                } else {
                  orderScreenController.switchValue.remove(supplies);
                }
              },
            ),
            Divider(color: Colors.grey.shade400),
            SwitchText(
              text: "Confirmed",
              color: orderScreenController.confirmed.value
                  ? AppColor.appColor
                  : Colors.grey.shade300,
              alignment: orderScreenController.confirmed.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              onTap: () {
                var confirm = "Confirmed";
                orderScreenController.confirmed.value =
                    !orderScreenController.confirmed.value;
                if (orderScreenController.confirmed.value) {
                  orderScreenController.switchValue.add(confirm.toString());
                } else {
                  orderScreenController.switchValue.remove(confirm);

                }
              },
            ),
            Divider(color: Colors.grey.shade400),
            SwitchText(
              text: "Order Dispatched",
              color: orderScreenController.ordDispatch.value
                  ? AppColor.appColor
                  : Colors.grey.shade300,
              alignment: orderScreenController.ordDispatch.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              onTap: () {
                var ordDis = "Order Dispatched";
                orderScreenController.ordDispatch.value =
                    !orderScreenController.ordDispatch.value;
                if (orderScreenController.ordDispatch.value) {
                  orderScreenController.switchValue.add(ordDis.toString());
                } else {
                  orderScreenController.switchValue.remove(ordDis);
                }
              },
            ),
            Divider(color: Colors.grey.shade400),
            SwitchText(
              text: "Rejected",
              color: orderScreenController.rejected.value
                  ? AppColor.appColor
                  : Colors.grey.shade300,
              alignment: orderScreenController.rejected.value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              onTap: () {
                var rjt = "Rejected";
                orderScreenController.rejected.value =
                    !orderScreenController.rejected.value;
                if (orderScreenController.rejected.value) {
                  orderScreenController.switchValue.add(rjt.toString());
                } else {
                  orderScreenController.switchValue.remove(rjt);
                }
              },
            ),
            Divider(color: Colors.grey.shade400),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          orderScreenController.page.value = 0;
          orderScreenController.orderList.clear();
          orderScreenController.getOrderList(
              loader: true, status: orderScreenController.switchValue);
          Get.back();
        },
        child: Container(
          width: Get.width,
          height: 50,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColor.appColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Apply Filter",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SwitchText extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;
  final Color? color;
  final AlignmentGeometry? alignment;

  const SwitchText({
    super.key,
    this.text,
    this.onTap,
    this.color,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text!,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 18,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: color,
              ),
              child: Align(
                alignment: alignment!,
                child: Container(
                  margin: const EdgeInsets.all(1),
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
