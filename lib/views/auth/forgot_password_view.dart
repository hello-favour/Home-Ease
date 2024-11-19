import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/utils/social_button.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordView extends ConsumerWidget {
  ForgotPasswordView({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                2.sH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(Assets.icons.arrowLeft),
                    ),
                    const Spacer(),
                    Text(
                      "New Password",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                  ],
                ),
                7.sH,
                const AppTextfield(
                  label: "Email",
                  textInputType: TextInputType.emailAddress,
                ),
                2.sH,
                AppTextfield(
                  label: "Enter New Password",
                  controller: passwordController,
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                2.sH,
                AppTextfield(
                  label: "Confirm Password",
                  controller: passwordController,
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                4.sH,
                AppButton(
                  title: "Send",
                  onTap: () {
                    context.push(AppRoutes.home);
                  },
                ),
                3.sH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.greyBgColor,
                      ),
                    ),
                    Text(
                      "   or   ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.greyBgColor,
                      ),
                    ),
                  ],
                ),
                3.sH,
                GestureDetector(
                  onTap: () {},
                  child: SocialButton(
                    icon: Assets.icons.google,
                    title: "Sign in with Google",
                  ),
                ),
                4.sH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.register);
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
