import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RetailerController extends GetxController{
  final retailerRegKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController firmController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController registerRetEmailController = TextEditingController();
  TextEditingController gstNumController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController adhaarImageController = TextEditingController();
  TextEditingController panImageController = TextEditingController();
  TextEditingController gstImageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  ImagePicker picker = ImagePicker();


  RxBool isCheck = false.obs;
  RxString countryValue = "".obs;
  RxString stateValue = "".obs;
  RxString cityValue = "".obs;


  getAdhaarDoc() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
     adhaarImageController.text = image.name.toString();
    }
  }
  getPanCardDoc() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      panImageController.text = image.name.toString();
    }
  }
  getGstDoc() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      gstImageController.text = image.name.toString();
    }
  }
}