import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xceed_group/screen/auth/log_in_screen/log_in_screen.dart';
import 'package:xceed_group/screen/dashboard/drawer/drawer_screen.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/profile_screen_controller.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/screens/address__screen.dart';
import 'package:xceed_group/screen/dashboard/profile_screen/screens/change_password_screen.dart';
import 'package:xceed_group/utils/icons.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileScreenController proScreenCon =
      Get.put(ProfileScreenController());

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: proScreenCon.scaffoldKey,
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Obx(
          () => proScreenCon.proSetting.value
              ? GestureDetector(
                  onTap: () {
                    proScreenCon.proSetting.value = false;
                  },
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  ),
                )
              : GestureDetector(
                  onTap: () =>
                      proScreenCon.scaffoldKey.currentState?.openDrawer(),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
        ),
        centerTitle: true,
        title: Obx(
          () => Text(
            proScreenCon.proSetting.value ? "Profile" : "XCUT UNITE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: proScreenCon.proSetting.value ? Colors.black : Colors.red,
            ),
          ),
        ),
        actions: [
          Obx(
            () => proScreenCon.proSetting.value
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: SvgPicture.asset(
                      SvgIcons.shoppingCartIcon,
                      // ignore: deprecated_member_use
                      color: Colors.black,
                    ),
                  ),
          )
        ],
      ),
      body: Obx(
        () => proScreenCon.proSetting.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, bottom: 15),
                    child: Text(
                      "Profile Setting",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  CommonRow(
                    onTap: () => Get.to(AddressScreen()),
                    text: "Address",
                    image: AppIcons.location,
                  ),
                  CommonRow(
                    onTap: () => Get.to(ChangePasswordScreen()),
                    text: "Change Password",
                    image: AppIcons.lock,
                  ),
                  CommonRow(
                    onTap: () {},
                    text: "My User Info",
                    image: AppIcons.icUser,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, bottom: 15),
                    child: Text(
                      "My Profile",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  CommonRow(
                    onTap: () {},
                    text: "My Orders",
                    icon: Icons.check_box_outline_blank,
                  ),
                  CommonRow(
                    onTap: () {
                      proScreenCon.proSetting.value = true;
                    },
                    text: "Profile Settings",
                    icon: Icons.settings_outlined,
                  ),
                  CommonRow(
                    onTap: () {
                      var box = GetStorage();
                      box.erase();
                      Get.offAll(() => LogInScreen());
                    },
                    text: "Logout",
                    icon: Icons.logout,
                  ),
                ],
              ),
      ),
    );
  }
}

class CommonRow extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final GestureTapCallback? onTap;
  final String? image;
  final ProfileScreenController proScreenCon =
      Get.put(ProfileScreenController());

  CommonRow({super.key, this.text, this.onTap, this.icon, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          children: [
            proScreenCon.proSetting.value
                ? Image.asset(
                    image!,
                    height: 25,
                  )
                : Icon(
                    icon,
                    color: Colors.grey,
                  ),
            const SizedBox(width: 30),
            Text(
              text!,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
