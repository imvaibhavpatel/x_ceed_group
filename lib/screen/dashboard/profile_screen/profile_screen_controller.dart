import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool proSetting = false.obs;
}