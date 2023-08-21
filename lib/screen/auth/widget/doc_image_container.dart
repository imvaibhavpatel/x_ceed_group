import 'package:flutter/material.dart';

class DocImageContainer extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Color? checkColor;
  final Color? textColor;

  const DocImageContainer(
      {super.key, this.text, this.onTap, this.checkColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text!,
                    style: TextStyle(fontSize: 16, color: textColor),
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
        Icon(
          Icons.check_circle,
          color: checkColor,
        )
      ],
    );
  }
}
