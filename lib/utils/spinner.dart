import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';

Widget spinner() => SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: AppColors.whiteColor,
      ),
    );
