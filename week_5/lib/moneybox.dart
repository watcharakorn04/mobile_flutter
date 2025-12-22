import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyBox extends StatelessWidget {
  String title = "";
  double amount = 0;
  double sizConHeight = 0;
  double borderRadius;
  Color colorSet = Colors.red;

  MoneyBox(
    this.title,
    this.amount,
    this.sizConHeight,
    this.borderRadius,
    this.colorSet,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: colorSet,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: sizConHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###.###").format(amount)} บาท',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
