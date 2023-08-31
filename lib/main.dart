import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xceed_group/controller/base_controller.dart';
import 'package:xceed_group/screen/auth/splash_screen/splash_screen.dart';

BaseController? baseCon;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  baseCon = Get.put(BaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
