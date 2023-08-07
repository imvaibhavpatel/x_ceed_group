import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  RxInt page = 0.obs;
  RxList onBoardingData = [
    {
      "tittle" : "Easy to Use",
      "description" : "Quickly find the product you want to its easy interface."
    },
    {
      "tittle" : "High Level Security",
      "description" : "Your information is safe with advanced encryption feature."
    },
    {
      "tittle" : "7-24 Support",
      "description" : "Any problem you can quickly support team immediately."
    },
  ].obs;
}
