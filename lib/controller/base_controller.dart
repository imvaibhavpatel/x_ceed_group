import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BaseController extends GetxController {
  var box = GetStorage();
  RxString userid = "".obs;
  RxString token = "".obs;

  getData() async {
    userid.value = await box.read("userId");
    token.value = await box.read("token");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getData();
  }
}
