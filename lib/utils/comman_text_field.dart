import 'package:flutter/material.dart';

class TextFieldCommon extends StatelessWidget {
  const TextFieldCommon({
    Key? key,
    required this.hintText,
    this.validation,
    this.controller,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final FormFieldValidator? validation;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          validator: validation,
          cursorColor: Colors.blue.shade800,
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
      ),
    );
  }
}
