import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/constants.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/global.dart';

class Home extends StatelessWidget {
  const Home({super.key});

//TODO: Prevent 2 scaffolds on top of each other (app,home)
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(title: 'Home'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text24Normal(text: 'Hello,',color: AppColors.primaryThreeElementText,fontWeight: FontWeight.bold),
                ),
                Container(
                  child: Text24Normal(text: Global.storageService.getString(AppConstants.STORAGE_USER_PROFILE_KEY),fontWeight: FontWeight.bold),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}