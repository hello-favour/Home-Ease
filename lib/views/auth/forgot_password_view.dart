import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/utils/social_button.dart';
import 'package:home_ease/utils/validators.dart';
import 'package:home_ease/views/auth/controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordView extends ConsumerWidget {
  ForgotPasswordView({super.key});

  final emailController = TextEditingController();

  // Declare FocusNodes for managing focus
  final emailFocusNode = FocusNode();

  /// Add the GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observe the authControllerProvider state
    final authState = ref.watch(authControllerProvider);

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
                        "Reset Password",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  7.sH,
                  AppTextfield(
                    validator: Validators.validateEmail,
                    label: "Email",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                  ),
                  4.sH,
                  AppButton(
                    title: authState.isLoading ? "Sending..." : "Send",
                    isLoading: authState.isLoading,
                    isDisabled: authState.isLoading,
                    onTap: authState.isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              final authController =
                                  ref.read(authControllerProvider.notifier);
                              final emailAddress = emailController.text.trim();

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
                                    content: Text(
                                        "Please fix the errors in the form")),
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
                    onTap: authState.isLoading
                        ? null
                        : () async {
                            final authController =
                                ref.read(authControllerProvider.notifier);
                            await authController.signInWithGoogle().then((_) {
                              final userState =
                                  ref.read(authControllerProvider);
                              userState.whenOrNull(
                                data: (user) {
                                  context.push(AppRoutes.home);
                                },
                                error: (error, stackTrace) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())),
                                  );
                                },
                              );
                            });
                            emailController.clear();
                          },
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
