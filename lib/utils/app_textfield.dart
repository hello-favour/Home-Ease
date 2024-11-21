import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/providers/obscure_text_notifier.dart';
import 'package:sizer/sizer.dart';

class AppTextfield extends ConsumerWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final IconData? icon;
  final bool obscureText;

  const AppTextfield({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    required this.textInputType,
    this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only watch the provider if both obscureText is true and controller is not null
    final isObscure = obscureText && controller != null
        ? ref.watch(obscureTextProvider(controller!))
        : false;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(10.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.blackColor,
              ),
          suffixIcon: obscureText &&
                  controller != null // Check if controller is not null
              ? GestureDetector(
                  onTap: () {
                    ref
                        .read(obscureTextProvider(controller!).notifier)
                        .toggle();
                  },
                  child: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.blackColor,
                  ),
                )
              : (icon != null ? Icon(icon, color: AppColors.blackColor) : null),
          contentPadding:
              EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.sp),
            borderSide: BorderSide(color: AppColors.blackColor, width: 1),
          ),
        ),
      ),
    );
  }
}
