import 'package:event_planning_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_styles.dart';

class AppTheme{
  static final ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: AppColors.babyBlueColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      unselectedLabelStyle: AppStyle.bold12white,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: AppStyle.bold12white,
      elevation: 0,

    ),

  );
  static final ThemeData darkTheme=ThemeData(
      scaffoldBackgroundColor: AppColors.darkColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        unselectedLabelStyle: AppStyle.bold12white,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.whiteColor,
        selectedLabelStyle: AppStyle.bold12white,
        elevation: 0,
      )
  );
}