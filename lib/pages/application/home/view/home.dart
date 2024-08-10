import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/constants.dart';
import 'package:ulearn_riverpod/common/widgets/app_bar.dart';
import 'package:ulearn_riverpod/common/widgets/search_widgets.dart';
import 'package:ulearn_riverpod/common/widgets/text_widgets.dart';
import 'package:ulearn_riverpod/global.dart';
import 'package:ulearn_riverpod/pages/application/home/view/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

//TODO: Prevent 2 scaffolds on top of each other (app,home)
  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                  child: Text24Normal(text: Global.storageService.getUserProfile()['age'].toString(),fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20,),
                searchBar(),
                SizedBox(height: 20,),
                banner(ref: ref),
              ],
            ),
          ),
        ),
      ),
    );
  }
}