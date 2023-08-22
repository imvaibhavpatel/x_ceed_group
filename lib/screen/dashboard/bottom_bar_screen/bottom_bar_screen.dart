import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/bottom_bar_screen/controller.dart';
import 'package:xceed_group/screen/dashboard/bottom_bar_screen/widget/bottom_bar_item_column.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/utils/icons.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class BottomBarScreen extends StatelessWidget {
  final BottomBarController bottomBarCon = Get.put(BottomBarController());
   BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(() =>  bottomBarCon.pages[bottomBarCon.currentBottomPage.value]),
      bottomNavigationBar: Container(
        width: Get.width,
        height: 70,
        padding: const EdgeInsets.only(top: 5),
        color: Colors.white,
        child: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarItemColumn(
                text: "Home",
                image: SvgIcons.homeIcon,
                color: bottomBarCon.currentBottomPage.value == 0
                    ? AppColor.appColor
                    : Colors.grey,
                onTap: () => bottomBarCon.currentBottomPage.value = 0,
              ),
              BottomBarItemColumn(
                text: "Product",
                image: SvgIcons.categoryIcon,
                color: bottomBarCon.currentBottomPage.value == 1
                    ? AppColor.appColor
                    : Colors.grey,
                onTap: () => bottomBarCon.currentBottomPage.value = 1,
              ),
              BottomBarItemColumn(
                text: "Order",
                image: SvgIcons.orderIcon,
                color: bottomBarCon.currentBottomPage.value == 2
                    ? AppColor.appColor
                    : Colors.grey,
                onTap: () => bottomBarCon.currentBottomPage.value = 2,
              ),
              GestureDetector(
                onTap: () {
                  bottomBarCon.currentBottomPage.value =3 ;
                },
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      AppIcons.invoice,
                      height: 25,
                      color: bottomBarCon.currentBottomPage.value == 3
                          ? AppColor.appColor
                          : Colors.grey,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Invoice",
                      style: TextStyle(
                        color: bottomBarCon.currentBottomPage.value == 3
                            ? AppColor.appColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              BottomBarItemColumn(
                text: "Profile",
                image: SvgIcons.profileIcon,
                color: bottomBarCon.currentBottomPage.value == 4
                    ? AppColor.appColor
                    : Colors.grey,
                onTap: () => bottomBarCon.currentBottomPage.value = 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
