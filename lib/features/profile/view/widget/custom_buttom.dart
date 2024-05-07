import 'package:flutter/material.dart';
import 'package:netfliex/core/Utils/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
  super.key,
  this.background = const Color(0xffE5AE8),
  required this.text,
  required this.onPressed,  this.fontSize=14, required Null Function() ,
});
final String text;
final Function() onPressed;
final Color background;
final double fontSize;

@override
Widget build(BuildContext context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColor.conColor,

          foregroundColor: AppColor.ScaffoldBG),
      onPressed: onPressed,
      child: Text(text,style: TextStyle(fontSize: fontSize),));
}
}