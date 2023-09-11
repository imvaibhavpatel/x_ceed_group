import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xceed_group/screen/dashboard/drawer/drawer_screen.dart';
import 'package:xceed_group/screen/dashboard/home/home_controller.dart';
import 'package:xceed_group/screen/dashboard/home/widget/container_text.dart';
import 'package:xceed_group/screen/dashboard/home/widget/financial_details_container.dart';
import 'package:xceed_group/screen/dashboard/out_standing_amount_screen/out_standing_amount_screen.dart';
import 'package:xceed_group/utils/app_color.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.2),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => homeController.scaffoldKey.currentState?.openDrawer(),
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "XCUT UNITE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              SvgIcons.shoppingCartIcon,
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Obx(
              () => homeController.isLoading.value
                  ? CircularProgressIndicator(color: Colors.blue)
                  : Column(
                      children: [
                        Obx(
                          () => homeController.bannerData.isEmpty
                              ? Container(
                                  height: 150,
                                  width: Get.width * 0.75,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.redAccent,
                                  ),
                                )
                              : CarouselSlider.builder(
                                  options: CarouselOptions(
                                    height: 200.0,
                                    autoPlay: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 0.8,
                                    onPageChanged: (index, reason) {
                                      homeController.currentPage.value = index;
                                    },
                                  ),
                                  itemCount: homeController.bannerData.length,
                                  itemBuilder: (context, index, realIndex) {
                                    return Obx(
                                      () => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 20,
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            homeController
                                                .bannerData[index].uploadPath,
                                            width: Get.width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                        SizedBox(
                          height: 8,
                          child: ListView.builder(
                            itemCount: homeController.bannerData.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  width:
                                      homeController.currentPage.value == index
                                          ? 18
                                          : 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: homeController.currentPage.value ==
                                            index
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
                                width: 105,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: Colors.deepPurpleAccent,
                              ),
                              Obx(
                                () => GestureDetector(
                                  onTap: () => homeController.selectDateRang(),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${DateFormat("dd MMM").format(homeController.dateRange.value.start).toString()} - ${DateFormat("dd MMM").format(homeController.dateRange.value.end).toString()}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        height: 30,
                                        SvgIcons.calendarIcon,
                                        // ignore: deprecated_member_use
                                        color: Colors.greenAccent.shade400,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Obx(
                          () => homeController.isLoading.value == true
                              ? const CircularProgressIndicator(
                                  color: Colors.blue)
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FinancialDetailsContainer(
                                            subTitle: "Booking Amt",
                                            color: Colors.redAccent,
                                            title: homeController
                                                .analyticsHomeDetails
                                                .value
                                                .bookingAmount
                                                .toString(),
                                          ),
                                          const SizedBox(width: 10),
                                          FinancialDetailsContainer(
                                            subTitle: "Invoice Amt",
                                            color: Colors.green.shade300,
                                            title: homeController
                                                .analyticsHomeDetails
                                                .value
                                                .invoiceAmount
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FinancialDetailsContainer(
                                            subTitle: "OutStanding Amt",
                                            color: Colors.deepPurpleAccent,
                                            title: homeController
                                                .analyticsHomeDetails
                                                .value
                                                .pendingAmount
                                                .toString(),
                                            date:
                                                "*${DateFormat("dd MMM").format(homeController.dateRange.value.start).toString()} - ${DateFormat("dd MMM").format(homeController.dateRange.value.end).toString()}",
                                            onTap: () => Get.to(() =>
                                                OutStandingAmountScreen()),
                                          ),
                                          const SizedBox(width: 10),
                                          FinancialDetailsContainer(
                                            subTitle: "Payment Done",
                                            color: Colors.amber.shade600,
                                            title: homeController
                                                .analyticsHomeDetails
                                                .value
                                                .paymentDoneAmount
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 15),
                                              color: AppColor.appColor,
                                              height: 1,
                                              width: Get.width,
                                            ),
                                          ),
                                          const Text(
                                            "Credit Limit Summary",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              color: AppColor.appColor,
                                              height: 1,
                                              width: Get.width,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      width: Get.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green.shade300,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              ContainerText(
                                                subTitle: "Total Outstanding",
                                                title: homeController
                                                    .analyticsHomeDetails
                                                    .value
                                                    .totalOutstandingAmount
                                                    .toString(),
                                              ),
                                              Container(
                                                height: 25,
                                                width: 1,
                                                margin: const EdgeInsets.only(
                                                  right: 15,
                                                  left: 55,
                                                ),
                                                color: Colors.white,
                                              ),
                                              ContainerText(
                                                subTitle: "Credit Limit",
                                                title: homeController
                                                    .analyticsHomeDetails
                                                    .value
                                                    .creditLimitAmount
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          const Text(
                                            "*Ensure your outstanding balance stays below the credit limit to avoid order placement errors",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        )
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
