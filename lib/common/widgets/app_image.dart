import 'package:flutter/material.dart';
Widget appImage({
  String imagePath = 'assets/icons/user.png',
  double width = 16,
  double height = 16,
  Color? color,
})
{
return Image.asset(
  imagePath = imagePath,
  width: width,
  height: height, 
  color: color,
);

}