import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled || isLoading ? null : onTap,
      child: Container(
        width: double.infinity,
        height: 5.5.h,
        decoration: BoxDecoration(
          color: isDisabled || isLoading
              ? AppColors.greyBgColor
              : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(99),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: AppColors.blackColor,
                  strokeWidth: 2,
                ),
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
      ),
    );
  }
}
