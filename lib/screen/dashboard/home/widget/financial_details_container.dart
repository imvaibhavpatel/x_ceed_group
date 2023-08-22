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
  final String? date;

  const FinancialDetailsContainer(
      {super.key,
      this.title,
      this.onTap,
      this.color,
      this.subTitle,
      this.date});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 10,
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
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  date ?? "",
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
              const SizedBox(height: 18),
              SvgPicture.asset(
                SvgIcons.arrowIcon,
                // ignore: deprecated_member_use
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
