import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/profile_screen_controller.dart';

class AddressScreen extends StatelessWidget {
  final ProfileScreenController proScreenCon =
      Get.put(ProfileScreenController());

  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "My Address",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "Test Address",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
                color: Colors.black,
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.home_outlined, color: Colors.grey),
                      Text("data"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.call, color: Colors.grey),
                      Text("data"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
