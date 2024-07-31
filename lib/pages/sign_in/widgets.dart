import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
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