import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

Container button(BuildContext context, {required title}) {
  return Container(
    width: Size.infinite.width,
    height: 6.h,
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(99),
      border: Border.all(
        color: AppColors.whiteColor,
      ),
    ),
    alignment: Alignment.center,
    child: Text(
      title,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.whiteColor,
          ),
    ),
  );
}
