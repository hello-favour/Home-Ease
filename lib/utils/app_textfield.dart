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
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const AppTextfield({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    required this.textInputType,
    this.validator,
    this.icon,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = obscureText && controller != null
        ? ref.watch(obscureTextProvider(controller!))
        : false;

    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: textInputType,
      focusNode: focusNode,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.darkGreyColor,
              fontWeight: FontWeight.w400,
            ),
        suffixIcon: obscureText && controller != null
            ? GestureDetector(
                onTap: () {
                  ref.read(obscureTextProvider(controller!).notifier).toggle();
                },
                child: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
              )
            : (icon != null
                ? Icon(
                    icon,
                    color: AppColors.primaryColor,
                  )
                : null),
        contentPadding:
            EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 2.5.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.sp),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),
        filled: true,
        fillColor: AppColors.greyColor,
      ),
      validator: validator,
    );
  }
}
