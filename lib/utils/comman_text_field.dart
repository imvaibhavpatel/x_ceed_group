import 'package:flutter/material.dart';
import 'package:xceed_group/utils/app_color.dart';

class TextFieldCommon extends StatelessWidget {
  const TextFieldCommon({
    Key? key,
    required this.hintText,
    this.validation,
    this.controller,
    this.suffixIcon,
    this.onTap,
    this.maxLine,
  }) : super(key: key);

  final String hintText;
  final FormFieldValidator? validation;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final int? maxLine;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        validator: validation,
        maxLines: maxLine ?? 1,
        cursorColor: AppColor.appColor,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: suffixIcon,
          fillColor: Colors.grey.shade200,
          border: InputBorder.none,
          hintText: hintText,
        ),
        onTap: onTap,
      ),
    );
  }
}
