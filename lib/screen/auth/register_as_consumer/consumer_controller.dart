import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsumerController extends GetxController{
  final consumerRegKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPassController = TextEditingController();
  TextEditingController registerRetypePassController = TextEditingController();

  RxBool isCheck = false.obs;
}