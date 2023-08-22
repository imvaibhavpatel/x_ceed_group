import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/product_screen/product_screen_controller.dart';

class ProductScreen extends StatelessWidget {
  final ProductScreenController productScreenController = Get.put(ProductScreenController());
   ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
