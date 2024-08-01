import 'package:flutter/material.dart';
import 'package:ulearn_riverpod/common/utils/app_colors.dart';

class AppTheme{

  static ThemeData appThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.primaryText)
    ),
    //Changes Default Icons for specific actions
    actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) {
            return const Icon(Icons.arrow_back_ios);
          },
        ),
  );

}