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
      body: PageView.builder(
        controller: onBoardingController.pageController,
        scrollDirection: Axis.horizontal,
        itemCount: onBoardingController.onBoardingData.length,
        onPageChanged: (page) {
          onBoardingController.currentPage.value = page;
        },
        itemBuilder: (BuildContext context, int index) {
          return Obx(
            () => Column(
              children: [
                const SizedBox(height: 150),
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
                  onBoardingController.onBoardingData[index]["description"]
                      .toString(),
                ),
                const SizedBox(height: 20),
                onBoardingController.currentPage.value + 1 ==
                        onBoardingController.onBoardingData.length
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  side: BorderSide(
                                    color: Colors.blue.shade700,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () => Get.to(() => const LogInScreen()),
                            child: const Text(
                              'Get started',
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              onPressed: () =>
                                  Get.to(() => const LogInScreen()),
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
                                      color: onBoardingController
                                                  .currentPage.value ==
                                              index
                                          ? Colors.blue
                                          : Colors.blue.shade100,
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    height: 8,
                                    width: onBoardingController
                                                .currentPage.value ==
                                            index
                                        ? 25
                                        : 8,
                                  );
                                },
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
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
          );
        },
      ),
    );
  }
}
