import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';
import 'package:dfzagency/dfz.dart';

class AppTransactionCard extends StatelessWidget {
  final String id;
  final String dateTime;
  final String? status;
  final String? title;
  final VoidCallback? onTap;

  AppTransactionCard({
    required this.id,
    required this.dateTime,
    this.status,
    this.title,
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
          color: status=='0' ?primaryColor:status=='1' ? Colors.amber : Colors.green,
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
                  Text(
                    title! ,
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
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
            if (status =='0')
            Icon(Icons.warning_amber, size: 20, color: Colors.black,),
            if (status =='1')
            Icon(Icons.handyman_rounded, size: 20, color: Colors.black,),
            if (status =='2')
            Icon(Icons.done, size: 20, color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
