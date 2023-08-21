import 'package:flutter/material.dart';

class ListTextStyle extends StatelessWidget {
  final String? date;
  final String? invoiceNo;
  final String? dueDate;
  final String? dueAmt;

  const ListTextStyle(
      {super.key, this.date, this.invoiceNo, this.dueDate, this.dueAmt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date!,
                    style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    invoiceNo!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    dueDate!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    dueAmt!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400.withOpacity(0.8),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300,
                    ),
                    child: const Text("Due"),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
