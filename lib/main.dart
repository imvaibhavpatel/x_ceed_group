import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/controller/base_controller.dart';
import 'package:xceed_group/screen/auth/splash_screen/splash_screen.dart';


BaseController? baseController;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
final BaseController baseController = Get.put(BaseController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
