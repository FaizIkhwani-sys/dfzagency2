import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
import 'package:dfzagency/dfz.dart';

class AppTransactionCard extends StatelessWidget {
  final String id;
  final String dateTime;
  final String? status;
  final VoidCallback? onTap;

  AppTransactionCard({
    required this.id,
    required this.dateTime,
    this.status,
    this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id ,
                    style: TextStyle(
                      color: secondaryColor,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    dateTime.toLowerCase() ,
                    style: TextStyle(
                      color: lightColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.info, size: 15, color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
