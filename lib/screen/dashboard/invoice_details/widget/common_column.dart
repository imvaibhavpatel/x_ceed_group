import 'package:flutter/material.dart';

class CommonColumn extends StatelessWidget {
  final String? text;
  final String? subText;

  const CommonColumn({super.key, this.text, this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text!,
          style: TextStyle(color: Colors.indigo.shade900),
        ),
        Text(
          subText?? "",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ],
    );
  }
}
