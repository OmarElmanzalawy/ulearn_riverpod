import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';

Widget Text24Normal({String text = '', Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 24,
      color: color,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget Text16Normal(
    {String text = '', Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.normal,
    ),
  );
}
