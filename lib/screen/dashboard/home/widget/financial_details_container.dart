import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:xceed_group/screen/dashboard/home/widget/container_text.dart';
import 'package:xceed_group/utils/svg_icons.dart';

class FinancialDetailsContainer extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final GestureTapCallback? onTap;
  final Color? color;

  const FinancialDetailsContainer(
      {super.key, this.title, this.onTap, this.color, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          width: Get.width * 0.50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContainerText(
                title: title!,
                subTitle: subTitle,
              ),
              const SizedBox(height: 10),
              SvgPicture.asset(
                SvgIcons.arrowIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
