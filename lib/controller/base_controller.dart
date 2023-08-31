import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BaseController extends GetxController {
  RxInt userid = 0.obs;
  RxString token = "".obs;
  RxString userName = "".obs;

  getData() async {
    var box = GetStorage();
    userid.value = box.read("user_id") ?? 0;
    token.value = box.read("user_token") ?? "";
    userName.value = box.read("user_fname") ?? "";
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getData();
  }
}
