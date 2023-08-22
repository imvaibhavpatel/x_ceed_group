import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/order_screen/order_screen_controller.dart';
class OrderScreen extends StatelessWidget {
  final OrderScreenController orderScreenController = Get.put(OrderScreenController());
   OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
