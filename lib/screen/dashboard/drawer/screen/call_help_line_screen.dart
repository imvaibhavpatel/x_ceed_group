import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/drawer/screen/call_controller.dart';
import 'package:xceed_group/utils/app_color.dart';

class CallHelpLineScreen extends StatelessWidget {
  final CallController callController = Get.put(CallController());

  CallHelpLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_outlined, color: AppColor.appColor),
        ),
        centerTitle: true,
        title: Text(
          "Call Helpline",
          style: TextStyle(color: AppColor.appColor),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.only(top: 60, bottom: 60),
            decoration: BoxDecoration(
              color: AppColor.appColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: const Center(
              child: Text(
                "Reach out to us.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => callController.makingPhoneCall(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(radius: 25),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Xceed Support",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.call_outlined,
                            size: 20,
                          ),
                          Text(
                            "2266154999",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.phone_callback_rounded,
                    color: Colors.grey,
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
