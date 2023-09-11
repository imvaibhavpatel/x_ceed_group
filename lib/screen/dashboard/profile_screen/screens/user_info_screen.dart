import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          "User information",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
