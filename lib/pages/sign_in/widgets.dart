import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

AppBar buildAppBar(){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    bottom: PreferredSize(
      child: Container(
        color: Colors.grey.withOpacity(0.3),
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

Widget appTextField({String text='',required String iconName,String hintText='default',bool sensitive=false}){
  return Container(
    padding: EdgeInsets.only(left: 25,right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        SizedBox(height: 5,),
        Container(
          width: 325,
          height: 50,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17),
                child: Image.asset('assets/icons/$iconName',width: 16,height: 16,),
                ),
              Container(
                width: 280,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    //hintStyle: TextStyle(color: AppColors.primaryThreeElementText),
                    hintText: hintText,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )
                    ),
                    //default border without any input
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent
                      )
                    )
                  ),
                  onChanged: (value) {
                    
                  },
                  maxLines: 1,
                  obscureText: sensitive,
                ),
              )
            ],
          ),
          decoration: appBoxDecorationTextField(),
        )
      ],
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