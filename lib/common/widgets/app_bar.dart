import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';

AppBar buildAppBar({String title='default'}){
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
    title: Text16Normal(text: title,color: AppColors.primaryText),
  );
}