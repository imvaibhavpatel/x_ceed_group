import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xceed_group/main.dart';
import 'package:xceed_group/screen/auth/log_in_screen/log_in_screen.dart';
import 'package:xceed_group/screen/dashboard/bottom_bar_screen/bottom_bar_screen.dart';
import 'package:xceed_group/screen/dashboard/drawer/screen/call_help_line_screen.dart';
import 'package:xceed_group/screen/dashboard/home/home_screen.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/profile_screen.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/utils/icons.dart';

class DrawerScreen extends StatelessWidget {

  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.appColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(AppIcons.user),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Get.to(ProfileScreen()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          baseCon!.userName.value.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "XCUT UNITE",
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.asset(
                              AppIcons.dropDown,
                              height: 15,
                              color: Colors.white,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextRow(
            text: "Home",
            icon: Icons.home_outlined,
            onTap: () => Get.to(() => BottomBarScreen()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
            child: Row(
              children: [
               Image.asset(AppIcons.checkList,color: Colors.white,height: 22,),
                const SizedBox(width: 20),
                const Text(
                  "Received Orders",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          TextRow(
            text: "Favourites",
            icon: Icons.favorite_border,
            onTap: () => Get.to(() => HomeScreen()),
          ),
          const Divider(indent: 20, color: Colors.white),
          TextRow(
            text: "Contact",
            icon: Icons.call,
            onTap: () => Get.to(() => CallHelpLineScreen()),
          ),
          TextRow(
            text: "LogOut",
            icon: Icons.directions_run_rounded,
            onTap: () {
              var box = GetStorage();
              box.erase();
              Get.offAll(() => LogInScreen());
            },
          ),
        ],
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final GestureTapCallback? onTap;

  const TextRow({super.key, this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
            Text(
              text!,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
