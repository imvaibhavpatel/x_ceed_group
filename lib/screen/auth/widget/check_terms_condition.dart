import 'package:flutter/material.dart';

class CheckTermCondition extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;



  const CheckTermCondition({super.key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return                     Row(
      children: [
        Transform.scale(
          scale: 1.3,
          child: Checkbox(
            side: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            activeColor: Colors.grey,
            value: value,
            onChanged: onChanged
          ),
        ),
        const Text(
          "Terms and Condition",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    )
    ;
  }
}
