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
import 'package:home_ease/utils/validators.dart';
import 'package:sizer/sizer.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Declare FocusNodes for managing focus
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  /// Add the FormKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Attach FormKey to the Form widget
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
                  AppTextfield(
                    label: "Email",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: Validators.validateEmail, // Add validation
                    focusNode: emailFocusNode,
                  ),
                  2.sH,
                  AppTextfield(
                    label: "Password",
                    controller: passwordController,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    validator: Validators.validatePassword, // Add validation
                    focusNode: passwordFocusNode,
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
                      if (_formKey.currentState?.validate() ?? false) {
                        /// Form is valid, navigate to home
                        context.push(AppRoutes.home);
                      } else {
                        /// Form is invalid, show validation errors
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please fix errors")),
                        );
                      }
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
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
      ),
    );
  }
}
