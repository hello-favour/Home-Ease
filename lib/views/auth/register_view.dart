import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class RegisterView extends ConsumerWidget {
  RegisterView({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final userNameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Image picker state
  final ValueNotifier<File?> profileImage = ValueNotifier<File?>(null);

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImage.value = File(pickedFile.path);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected.')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Form(
            key: _formKey,
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
                      "Let's get started",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                  ],
                ),
                7.sH,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        3.sH,
                        // Profile Image Upload Section
                        ValueListenableBuilder<File?>(
                          valueListenable: profileImage,
                          builder: (context, value, _) {
                            return GestureDetector(
                              onTap: () => _pickImage(context),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    value != null ? FileImage(value) : null,
                                backgroundColor: AppColors.greyBgColor,
                                child: value == null
                                    ? Icon(
                                        Icons.camera_alt,
                                        color: AppColors.primaryColor,
                                        size: 30,
                                      )
                                    : null,
                              ),
                            );
                          },
                        ),
                        2.sH,
                        AppTextfield(
                          label: "Username",
                          controller: usernameController,
                          textInputType: TextInputType.name,
                          validator: Validators.validateName,
                        ),
                        2.sH,
                        AppTextfield(
                          label: "Email",
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: Validators.validateEmail,
                          focusNode: emailFocusNode,
                        ),
                        2.sH,
                        AppTextfield(
                          label: "Password",
                          controller: passwordController,
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          validator: Validators.validatePassword,
                          focusNode: passwordFocusNode,
                        ),
                        2.sH,
                        AppTextfield(
                          label: "Confirm Password",
                          controller: confirmPasswordController,
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) =>
                              Validators.validateConfirmPassword(
                                  value, passwordController.text),
                          focusNode: confirmPasswordFocusNode,
                        ),
                        3.sH,
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque quis elit tellus. Nunc aliquam sit",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        4.sH,
                        AppButton(
                          title:
                              authState.isLoading ? "Signing up..." : "Sign Up",
                          isLoading: authState.isLoading,
                          isDisabled: authState.isLoading,
                          onTap: authState.isLoading
                              ? null
                              : () async {
                                  if (_formKey.currentState!.validate()) {
                                    if (profileImage.value == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please upload a profile image!")),
                                      );
                                      return;
                                    }

                                    final authController = ref
                                        .read(authControllerProvider.notifier);
                                    final username =
                                        usernameController.text.trim();
                                    final email = emailController.text.trim();
                                    final password =
                                        passwordController.text.trim();
                                    final confirmPassword =
                                        confirmPasswordController.text.trim();

                                    if (password != confirmPassword) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Passwords do not match!"),
                                        ),
                                      );
                                      return;
                                    }

                                    // Call the signUp method
                                    await authController
                                        .signUp(
                                      email,
                                      password,
                                      username,
                                      profileImage.value.toString(),
                                    )
                                        .then((_) {
                                      final userState =
                                          ref.read(authControllerProvider);
                                      userState.whenOrNull(
                                        data: (user) {
                                          context.push(AppRoutes.home);
                                        },
                                        error: (error, stackTrace) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                error.toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    });
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
                          onTap: () {
                            final authController =
                                ref.read(authControllerProvider.notifier);
                            authController.signInWithGoogle().then((_) {
                              final userState =
                                  ref.read(authControllerProvider);
                              userState.whenOrNull(
                                data: (user) {
                                  context.push(AppRoutes.home);
                                },
                                error: (error, stackTrace) {
                                  debugPrint("GOOGLE ERROR:$error");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(error.toString())),
                                  );
                                },
                              );
                            });
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
                              "Already have an account?  ",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.push(AppRoutes.login);
                              },
                              child: Text(
                                "Sign In",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
