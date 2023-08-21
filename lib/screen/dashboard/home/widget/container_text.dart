
import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const ContainerText({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subTitle!,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
