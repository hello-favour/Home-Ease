import 'package:flutter/cupertino.dart';
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
import 'package:sizer/sizer.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool check = true;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            2.sH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(Assets.icons.arrowLeft),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            2.sH,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: AppColors.color2,
                            backgroundImage:
                                AssetImage(Assets.images.profile.path),
                          ),
                          Positioned(
                            top: 85,
                            left: 100,
                            child: CircleAvatar(
                              radius: 16.sp,
                              backgroundColor: AppColors.primaryColor,
                              child: const Icon(
                                Icons.camera_alt,
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.sH,
                      const AppTextfield(
                        label: "Username",
                        textInputType: TextInputType.name,
                      ),
                      3.sH,
                      const AppTextfield(
                        label: "Email",
                        textInputType: TextInputType.emailAddress,
                      ),
                      3.sH,
                      const AppTextfield(
                        label: "Password",
                        textInputType: TextInputType.visiblePassword,
                      ),
                      3.sH,
                      const AppTextfield(
                        label: "Confirm Password",
                        textInputType: TextInputType.visiblePassword,
                      ),
                      3.sH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dark Mode",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          CupertinoSwitch(
                            value: check,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16.sp, right: 16.sp, bottom: 20.sp),
        child: AppButton(
          title: "Update Profile",
          onTap: () {
            context.push(AppRoutes.home);
          },
        ),
      ),
    );
  }
}
