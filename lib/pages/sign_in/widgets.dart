import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

AppBar buildAppBar(){
  return AppBar(

    bottom: PreferredSize(
      child: Container(
        color: Colors.red,
        height: 1,
      ),
      preferredSize: Size.fromHeight(1),
    ),
    centerTitle: true,
    title: Text16Normal(text: 'Login',color: AppColors.primaryText),
  );
}

Widget thirdPartyLogin(){
  return Container(
    margin: EdgeInsets.only(
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

Widget appTextField({String text=''}){
  return Container(
    padding: EdgeInsets.only(left: 25,right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        Container(
          width: 325,
          height: 50,
          child: TextField(

          ),
          decoration: appBoxDecorationTextField(),
        )
      ],
    ),
  );
}