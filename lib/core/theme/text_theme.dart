import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const String fontFamily = 'Metropolis';

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.blackColor,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.whiteColor,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
  );
}
