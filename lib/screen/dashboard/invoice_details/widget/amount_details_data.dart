import 'package:flutter/material.dart';

class AmountDetailsData extends StatelessWidget {
  final String? text;
  final String? textValue;
  final Color?  color;
  final double? fontSize;

  const AmountDetailsData({super.key, this.text, this.textValue, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text!,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          "\u{20B9}$textValue",
          style:  TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize ?? 16,
            color: color ?? Colors.black
          ),
        )
      ],
    );
  }
}
