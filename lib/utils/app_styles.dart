import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  static TextStyle bold20primary =const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: AppColors.primaryColor
  );
  static TextStyle medium16black =const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: AppColors.blackColor
  );
  static TextStyle medium20primary =const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: AppColors.primaryColor
  );
  static TextStyle medium20white =const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Colors.white
  );
  static TextStyle regular36primary =const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 36,
      color: AppColors.primaryColor
  );
  static TextStyle medium16gray =const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: AppColors.grayColor
  );
  static TextStyle bold12white =const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12,
      color: AppColors.whiteColor
  );
  static TextStyle bold14black =const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: AppColors.blackColor
  );
}