import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xceed_group/auth/log_in_screen/log_in_screen.dart';
import 'package:xceed_group/auth/on_boarading_screen/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onBoardingController.pageController,
                scrollDirection: Axis.horizontal,
                itemCount: onBoardingController.onBoardingData.length,
                onPageChanged: (page) {
                  onBoardingController.currentPage.value = page;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 350),
                      Image.asset(
                        onBoardingController.onBoardingData[index]["image"]
                            .toString(),
                        height: 175,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        onBoardingController.onBoardingData[index]["tittle"]
                            .toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        onBoardingController.onBoardingData[index]
                                ["description"]
                            .toString(),
                      ),
                    ],
                  );
                },
              ),
            ),
            onBoardingController.currentPage.value + 1 ==
                    onBoardingController.onBoardingData.length
                ? GestureDetector(
                    onTap: () => Get.to(() => LogInScreen()),
                    child: Container(
                      height: 42,
                      width: 190,
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.blue.shade800),
                      ),
                      child: Center(
                          child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                        ),
                      )),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () => Get.to(() => LogInScreen()),
                        ),
                        SizedBox(
                          height: 8,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:
                                      onBoardingController.currentPage.value ==
                                              index
                                          ? Colors.blue.shade800
                                          : Colors.grey,
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 8,
                                width: onBoardingController.currentPage.value ==
                                        index
                                    ? 9
                                    : 8,
                              );
                            },
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.blue.shade800,
                            ),
                          ),
                          onPressed: () {
                            onBoardingController.pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceInOut);
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
