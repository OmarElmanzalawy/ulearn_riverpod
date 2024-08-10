import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/image_res.dart';
import 'package:ulearn_riverpod/common/widgets/app_image.dart';
import 'package:ulearn_riverpod/common/widgets/app_shadow.dart';
import 'package:ulearn_riverpod/common/widgets/app_textfield.dart';

Widget searchBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 310,
        height: 40,
        decoration: appBoxShadow(
          color: AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: appImage(
                imagePath: ImageRes.search2
              ),
            ),
            appTextFieldOnly(width: 265,height:40,hintText: 'Search your course'),
            
          ],
        ),
      ),
      searchBarBtn(),
    ],
  );
}

Widget searchBarBtn(){

  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(5),
      width: 40,
      height: 40,
      child: appImage(imagePath: ImageRes.options),
      decoration: appBoxShadow(
        border: Border.all(color: AppColors.primaryElement)
      ),
    ),
  );

}

