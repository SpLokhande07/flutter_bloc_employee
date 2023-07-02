import 'package:employee_ri/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomText(
      {super.key,
      required this.title,
      this.color,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color ?? kFontColor,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
