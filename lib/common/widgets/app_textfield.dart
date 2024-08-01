import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

Widget appTextField({String text='',required String iconName,String hintText='default',bool sensitive=false}){
  return Container(
    padding: const EdgeInsets.only(left: 25,right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        const SizedBox(height: 5,),
        Container(
          width: 350,
          height: 50,
          decoration: appBoxDecorationTextField(),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 17),
                child: Image.asset('assets/icons/$iconName',width: 16,height: 16,),
                ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 280,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    //hintStyle: TextStyle(color: AppColors.primaryThreeElementText),
                    hintText: hintText,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      )
                    ),
                    //default border without any input
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent
                      )
                    ),
                    focusedBorder: const OutlineInputBorder(
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
        )
      ],
    ),
  );
}