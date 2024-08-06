import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
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