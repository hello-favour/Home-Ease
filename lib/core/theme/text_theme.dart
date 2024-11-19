import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_ease/core/constants/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.dmSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor,
    ),
    headlineMedium: GoogleFonts.dmSans(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    headlineSmall: GoogleFonts.dmSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    titleLarge: GoogleFonts.dmSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor,
    ),
    titleMedium: GoogleFonts.dmSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    titleSmall: GoogleFonts.dmSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    bodyLarge: GoogleFonts.dmSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    bodyMedium: GoogleFonts.dmSans(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.blackColor,
    ),
    bodySmall: GoogleFonts.dmSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    labelLarge: GoogleFonts.dmSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
    labelMedium: GoogleFonts.dmSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
  );

//DARK THEME

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.dmSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor,
    ),
    headlineMedium: GoogleFonts.dmSans(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    headlineSmall: GoogleFonts.dmSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    titleLarge: GoogleFonts.dmSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ),
    titleMedium: GoogleFonts.dmSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
    ),
    titleSmall: GoogleFonts.dmSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    bodyLarge: GoogleFonts.dmSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    bodyMedium: GoogleFonts.dmSans(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.whiteColor,
    ),
    bodySmall: GoogleFonts.dmSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    labelLarge: GoogleFonts.dmSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
    labelMedium: GoogleFonts.dmSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColor,
    ),
  );
}
