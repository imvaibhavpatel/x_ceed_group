import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/home/home_controller.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/utils/icons.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 50,
              bottom: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Xceed Group",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                SvgPicture.asset(
                  SvgIcons.shoppingCartIcon,
                  color: Colors.black,
                )
              ],
            ),
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                homeController.currentPage.value = index;
              },
              height: 180.0,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: Get.width,
                margin: const EdgeInsets.all(15),
                color: AppColor.appColor,
                child: const Icon(
                  Icons.ac_unit,
                  size: 70,
                ),
              );
            },
          ),
          SizedBox(
            height: 8,
            child: ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(
                  () => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    // height: 5,
                    width: homeController.currentPage.value == index ? 15 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: homeController.currentPage.value == index
                          ? AppColor.appColor
                          : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  "Financials",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  height: 1,
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.deepPurpleAccent,
                ),
                const Text(
                  "15 Jul - 14 Aug  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SvgPicture.asset(
                  height: 30,
                  SvgIcons.calendarIcon,
                  color: Colors.green,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    width: Get.width * 0.50,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "23568844",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Booking Amt",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        SvgPicture.asset(SvgIcons.arrowIcon,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    width: Get.width * 0.50,
                    decoration: BoxDecoration(
                      color: Colors.green.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "23568844",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Invoice Amt",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        SvgPicture.asset(SvgIcons.arrowIcon,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    width: Get.width * 0.50,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "64643",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Outstanding Amt",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          SvgIcons.arrowIcon,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    width: Get.width * 0.50,
                    decoration: BoxDecoration(
                      color: Colors.amber.shade600,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "0",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Payment Amt",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        SvgPicture.asset(
                          SvgIcons.arrowIcon,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: Get.width,
        height: 70,
        padding: const EdgeInsets.only(top: 5),
        color: Colors.white,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  homeController.currentBottomPage.value = 1;
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      SvgIcons.homeIcon,
                      color: homeController.currentBottomPage.value == 1
                          ? AppColor.appColor
                          : Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: homeController.currentBottomPage.value == 1
                            ? AppColor.appColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  homeController.currentBottomPage.value = 2;
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      SvgIcons.categoryIcon,
                      color: homeController.currentBottomPage.value == 2
                          ? AppColor.appColor
                          : Colors.grey,
                    ),
                    Text(
                      "Product",
                      style: TextStyle(
                        color: homeController.currentBottomPage.value == 2
                            ? AppColor.appColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  homeController.currentBottomPage.value = 3;
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      SvgIcons.orderIcon,
                      color: homeController.currentBottomPage.value == 3
                          ? AppColor.appColor
                          : Colors.grey,
                    ),
                    Text(
                      "Order",
                      style: TextStyle(
                        color: homeController.currentBottomPage.value == 3
                            ? AppColor.appColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  homeController.currentBottomPage.value = 4;
                },
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Image.asset(
                      AppIcons.invoice,
                      height: 25,
                      color: homeController.currentBottomPage.value == 4
                          ? AppColor.appColor
                          : Colors.grey,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Invoice",
                      style: TextStyle(
                        color: homeController.currentBottomPage.value == 4
                            ? AppColor.appColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  homeController.currentBottomPage.value = 5;
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      SvgIcons.profileIcon,
                      color: homeController.currentBottomPage.value == 5
                          ? AppColor.appColor
                          : Colors.grey,
                    ),
                    Expanded(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: homeController.currentBottomPage.value == 5
                              ? AppColor.appColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
