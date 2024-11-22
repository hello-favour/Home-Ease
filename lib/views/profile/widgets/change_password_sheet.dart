import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:sizer/sizer.dart';

class PasswordChangeSheet extends ConsumerWidget {
  const PasswordChangeSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.sp),
          topRight: Radius.circular(20.sp),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Password Change",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          2.sH,
          const AppTextfield(
            label: "Old Password",
            textInputType: TextInputType.visiblePassword,
          ),
          2.sH,
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.greyColor,
                    ),
              ),
            ),
          ),
          2.sH,
          const AppTextfield(
            label: "New Password",
            textInputType: TextInputType.visiblePassword,
          ),
          2.sH,
          const AppTextfield(
            label: "Confirm Password",
            textInputType: TextInputType.visiblePassword,
          ),
          const Spacer(),
          AppButton(
            title: "SAVE PASSWORD",
            onTap: () {
              context.push(AppRoutes.home);
            },
          ),
          2.sH,
        ],
      ),
    );
  }
}
