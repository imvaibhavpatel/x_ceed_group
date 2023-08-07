import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: ()=> Get.back(),
                child: Icon(Icons.close),
              ),
            ),
          ),
          Text(
            "Register as",
            style: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
