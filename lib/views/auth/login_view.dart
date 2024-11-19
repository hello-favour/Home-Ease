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

class LoginView extends ConsumerWidget {
  LoginView({super.key});

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
                      "Welcome Back!",
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
                  label: "Password",
                  controller: passwordController,
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                3.sH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.forgotPassword);
                      },
                      child: Text(
                        "Forgot your password?",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                3.sH,
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque quis elit tellus. Nunc aliquam sit",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                4.sH,
                AppButton(
                  title: "Login",
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
                      "Don't have an account?  ",
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
