import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AppButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Size.infinite.width,
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(99),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.blackColor,
              ),
        ),
      ),
    );
  }
}
