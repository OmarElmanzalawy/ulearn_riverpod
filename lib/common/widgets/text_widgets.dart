import 'package:flutter/material.dart';

Widget Text24Normal({String text='',Color color=Colors.black}) {
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
