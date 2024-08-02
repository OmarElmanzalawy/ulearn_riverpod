import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//TODO customize popup to alert user that an error occured
popupError(
  String msg, {
  Color backgroundColor = Colors.red,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16);
}

popupInfo(
  String msg, {
  Color backgroundColor = Colors.blue,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16);
}
