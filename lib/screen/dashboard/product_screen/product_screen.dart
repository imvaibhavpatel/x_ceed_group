import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/product_screen/product_screen_controller.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class ProductScreen extends StatelessWidget {
  final ProductScreenController productScreenController =
      Get.put(ProductScreenController());

  ProductScreen({super.key});

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
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // var box = GetStorage();
                    // box.erase();
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(Icons.menu),
                ),
                const SizedBox(width: 20),
                const Text(
                  "XCUT UNITE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  SvgIcons.shoppingCartIcon,
                  // ignore: deprecated_member_use
                  color: Colors.black,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: Get.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: productScreenController.searchCon,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Search",
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(SvgIcons.searchIcons),
                          ),
                        ),
                        onSubmitted: (value) {},
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0XFF1929BF),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.width,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ConText(
                              text: "65854",
                              fontWeight: FontWeight.bold,
                              textSize: 18,
                            ),
                            ConText(
                              text: "Brand:",
                              textSize: 13,
                              textColor: Colors.grey.shade600,
                            ),
                            ConText(
                              text: "SKU: ISo11051",
                              textSize: 13,
                              textColor: Colors.grey.shade600,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const ConText(
                                  text: "Stock",
                                  fontWeight: FontWeight.w500,
                                  textSize: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade50,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const ConText(
                                    text: "0",
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ConText extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final Color? textColor;
  final double? textSize;

  const ConText(
      {super.key, this.text, this.fontWeight, this.textColor, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontWeight: fontWeight,
          color: textColor ?? Colors.black,
          fontSize: textSize),
    );
  }
}
