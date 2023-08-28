import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/home/home_screen.dart';
import 'package:xceed_group/screen/dashboard/invoice_screen/invoice_screen.dart';
import 'package:xceed_group/screen/dashboard/order_screen/order_screen.dart';
import 'package:xceed_group/screen/dashboard/product_screen/product_screen.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/profile_screen.dart';

class BottomBarController extends GetxController {
  RxInt currentBottomPage = 0.obs;

  List<dynamic> pages = [
    HomeScreen(),
    ProductScreen(),
    OrderScreen(),
    InvoiceScreen(),
    ProfileScreen(),
  ];
}
