import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';
import 'package:ulearn_riverpod/common/widgets/app_image.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryElement),
    label: 'Home'
  ),
  BottomNavigationBarItem(
    icon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryElement),
    label: 'Home'
  ),
  BottomNavigationBarItem(
    icon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryElement),
    label: 'Home'
  ),
  BottomNavigationBarItem(
    icon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryFourElementText),
    activeIcon: appImage(imagePath: 'assets/icons/home.png',color: AppColors.primaryElement),
    label: 'Home'
  ),
];