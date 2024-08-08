import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/utils/image_res.dart';
import 'package:ulearn_riverpod/common/widgets/app_image.dart';
import 'package:ulearn_riverpod/pages/application/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: appImage(imagePath: ImageRes.home,color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: ImageRes.home,color: AppColors.primaryElement),
    label: 'Home'
  ),
  BottomNavigationBarItem(
    icon: appImage(imagePath: ImageRes.search,color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: ImageRes.search,color: AppColors.primaryElement),
    label: 'Search'
  ),
  BottomNavigationBarItem(
    icon: appImage(imagePath: ImageRes.play,color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: ImageRes.play,color: AppColors.primaryElement),
    label: 'Play'
  ),
  BottomNavigationBarItem(
    icon: appImage(imagePath: ImageRes.message,color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: ImageRes.message,color: AppColors.primaryElement),
    label: 'Message'
  ),
    BottomNavigationBarItem(
    icon: appImage(imagePath: ImageRes.profilePhoto,color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: ImageRes.profilePhoto,color: AppColors.primaryElement),
    label: 'Profile'
  ),
];

Widget homeScreens(int index){
  List<Widget> screens = [
    const Home(),
    Center(child: appImage(imagePath: ImageRes.search,width: 250,height: 250),),
    Center(child: appImage(imagePath: ImageRes.play,width: 250,height: 250,color: AppColors.primaryFourElementText),),
    Center(child: appImage(imagePath: ImageRes.message,width: 250,height: 250),),
    Center(child: appImage(imagePath: ImageRes.profilePhoto,width: 250,height: 250),),
  ];

  return screens[index];
}