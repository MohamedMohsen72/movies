
 import 'package:flutter/material.dart';
import 'package:netfliex/core/Utils/color.dart';

import 'package:netfliex/core/Utils/text_styles.dart';

 class CustomElevatedButton extends StatelessWidget {
   const CustomElevatedButton(
       {super.key,
         required this.text,
         required this.onPressed,
         required this.foreground,
         required this.background,
         required this.height,this.wight=200,  this.style, this.radius,});
   final String text;
   final Function() onPressed;
   final Color foreground;
   final Color background;
   final double height;
   final double wight;
   final TextStyle ?style;
   final double ?radius;
   @override
   Widget build(BuildContext context) {
     return SizedBox(
       width:wight ,
       height: height,
       child: ElevatedButton(
           style: ElevatedButton.styleFrom(
               foregroundColor: foreground,
               backgroundColor: background,
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(radius??15))),
           onPressed: onPressed,
           child: Text(text,style:style?? getTextbady(fontWeight: FontWeight.bold,fontSize: 20,color:AppColor.balckColor),)),

     );
   }
 }
