import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileScreenController profileScreenController = Get.put(ProfileScreenController());
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
