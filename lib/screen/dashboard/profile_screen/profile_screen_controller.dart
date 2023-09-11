import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  TextEditingController passCon = TextEditingController();
  TextEditingController newPassCon = TextEditingController();
  TextEditingController confirmPassCon = TextEditingController();

  RxBool proSetting = false.obs;
  RxBool isEyes1 = false.obs;
  RxBool isEyes2 = false.obs;
}
