import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dfzagency/dfz.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Function() onTap;

  const ProductCard({
    Key? key,
    required this.title,
    required this.price,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            clipBehavior: Clip.none, children: [
              Container(
                // width: 400,
                width: AppSize.widthScreen(context) * 0.5,
                height: AppSize.heightScreen(context) * 0.2,
                // margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                  )
                  // color: Colors.blueAccent,
                ),
              ),
              Positioned(
                left: 0,
                bottom: -20,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                bottom: -40,
                child: Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
