import 'package:flutter/material.dart';

import 'package:dfzagency/dfz.dart';

class AppSubmitButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double? height;
  final double? width;
  final Color btnColor;
  final Color textColor;

  const AppSubmitButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.height = 50,
    this.width,
    this.btnColor = primaryColor,
    this.textColor = lightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: width ?? AppSize.widthScreen(context),
          height: height,
          decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(
              child: TextManrope(
                text: title,
                color: textColor,
                fontSize: MediaQuery.of(context).textScaleFactor * 17,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}

class AppSubmitOutlineButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const AppSubmitOutlineButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: darkColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        width: AppSize.widthScreen(context),
        height: 54.0,
        decoration: BoxDecoration(
          border: Border.all(color: darkColor, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
            child: TextManrope(
              text: title,
              color: darkColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
        ),
      ),
    );
  }
}

class AppSubmitWithArrow extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const AppSubmitWithArrow({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: AppSize.widthScreen(context),
          height: 50.0,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Center(
              child: Row(
                mainAxisAlignment: AppSize.mainCenter,
                children: [
                  TextManrope(
                    text: title,
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).textScaleFactor * 17,
                    fontWeight: FontWeight.bold,
                  ),
                  const Icon(
                    Icons.arrow_right_sharp,
                    size: 30,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}