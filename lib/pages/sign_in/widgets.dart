import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

Widget thirdPartyLogin(){
  return Container(
    margin: const EdgeInsets.only(
      left: 80,right: 80,top: 40,bottom: 20
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton('assets/icons/google.png'),
        _loginButton('assets/icons/apple.png'),
        _loginButton('assets/icons/facebook.png'),
      ],
    ),
  );
}

Widget _loginButton(String imagepath){
  return GestureDetector(
    onTap: (){},
    child: Container(
      width: 40,
      height: 40,
      child: Image.asset(imagepath,fit: BoxFit.cover,),
    ),
  );
}


Widget textUnderline({String text=''}){

  return GestureDetector(
    onTap: (){},
    child: Text(text,
    style: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: AppColors.primaryText,
      decoration: TextDecoration.underline
    ),
    ),
  );
}