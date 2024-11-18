import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class AppTextfield extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool obscureText;

  const AppTextfield({
    super.key,
    this.controller,
    this.obscureText = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 0.5,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.greyColor,
                ),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
