import 'package:flutter/material.dart';

class ProductDetailsContainer extends StatelessWidget {
  final String? proName;
  final String? proQty;
  final String? proRate;

  const ProductDetailsContainer(
      {super.key, this.proName, this.proQty, this.proRate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.green.shade600,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    proName!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Qty: $proQty",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "\u{20B9} $proRate / Units",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade900,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
