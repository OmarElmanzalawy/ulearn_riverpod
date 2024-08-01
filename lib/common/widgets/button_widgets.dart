import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

Widget appTextButton({String title='',double width=325,double height = 50,Color backgroundcolor=AppColors.primaryElement,Color textColor= AppColors.primaryBackground,bool hasBorder=false, VoidCallback? ontap}){

  return GestureDetector(
    onTap: ontap ?? (){

    },
    child: Container(
      width: width,
      height: height,
      decoration: appBoxShadow(color: backgroundcolor, border: hasBorder ? Border.all(color: AppColors.primaryFourElementText) : null),
      child: Center(child: Text16Normal(text: title,color: textColor)),
    ),
  );

}