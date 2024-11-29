import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/controllers/auth_controller.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/utils/social_button.dart';
import 'package:home_ease/utils/validators.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordView extends ConsumerWidget {
  ForgotPasswordView({super.key});

  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();

  // Declare FocusNodes for managing focus
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  /// Add the GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Attach the Form Key here
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
                  AppTextfield(
                    validator: Validators.validateEmail,
                    label: "Email",
                    controller: email,
                    textInputType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                  ),
                  2.sH,
                  AppTextfield(
                    validator: Validators.validatePassword,
                    label: "Enter New Password",
                    controller: password,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    focusNode: passwordFocusNode,
                  ),
                  2.sH,
                  AppTextfield(
                    validator: (value) => Validators.validateConfirmPassword(
                        value, password.text),
                    label: "Confirm Password",
                    controller: confirmPassword,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    focusNode: confirmPasswordFocusNode,
                  ),
                  4.sH,
                  AppButton(
                    title: "Send",
                    onTap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final authController =
                            ref.read(authControllerProvider.notifier);
                        final emailAddress = email.text.trim();

                        await authController
                            .forgotPassword(emailAddress)
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Password reset email sent! Check your inbox."),
                            ),
                          );
                          context.pop();
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())),
                          );
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text("Please fix the errors in the form")),
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
                        "Already have an account?  ",
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
