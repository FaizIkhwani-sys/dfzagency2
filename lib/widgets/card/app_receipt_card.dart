import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

class AppReceiptCard extends StatelessWidget {
  final String itemName;
  final String quantity;
  final double price;
  final int? index;


  AppReceiptCard({
    required this.itemName,
    required this.quantity,
    required this.price,
    this.index

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: backgroundColor,
          width: AppSize.widthScreen(context)*0.45,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text("$index . $itemName",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 13,
              ),
              maxLines: 3,
            ),
          ),
        ),
        Container(
          color: backgroundColor,
          width: AppSize.widthScreen(context)*0.15,
          child: Text(quantity,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        Container(
          color: backgroundColor,
          width: AppSize.widthScreen(context)*0.35,
          child: Text("${price.toStringAsFixed(2)}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
