import 'dart:math';
import 'package:flutter/material.dart';

final random = Random();
const Color primaryColor = Colors.red;
const Color secondaryColor = Color(0xff2e398d);
const Color backgroundColor = Color(0xfff7fafc);
const Color lightColor = Color(0xfff2f3f7);
const Color labelTextColor = Color(0xff4a5568);
const Color grayColor = Color(0xffa0aec0);
const Color dangerColor = Color(0xffff4646);
const Color darkColor = Color(0xff2d3748);
const Color darkTextColor = Color(0xFF2D3748);
const Color successColor = Color(0xff48bb78);
const Color whiteColor = Color(0xFFFFFFFF);
const Color warningColor = Color(0xff667eea);
const Color darkBlueColor = Color(0xff394867);
const Color cardColor = Color(0xFFF5F4F8);
final Color? randomColors = Colors.primaries[random.nextInt(Colors.primaries.length)]
[random.nextInt(9) * 100];
