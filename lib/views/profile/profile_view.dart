import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/auth/controller/auth_controller.dart';
import 'package:home_ease/views/profile/widgets/profile_row.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  final bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            2.sH,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.color2,
                      backgroundImage: AssetImage(Assets.images.profile.path),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Hi, ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(
                                  color: AppColors.primaryColor,
                                ),
                          ),
                          TextSpan(
                            text: "Jane Doe",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    Text("jane@gmail.com",
                        style: Theme.of(context).textTheme.titleSmall),
                    5.sH,
                    ProfileRow(
                      onTap: () {},
                      title: 'Orders',
                    ),
                    2.sH,
                    ProfileRow(
                      onTap: () {},
                      title: 'Cart',
                    ),
                    2.sH,
                    ProfileRow(
                      onTap: () {},
                      title: 'Payment',
                    ),
                    2.sH,
                    ProfileRow(
                      onTap: () {
                        context.push(AppRoutes.setting);
                      },
                      title: 'Wish List',
                    ),
                    2.sH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dark mode",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        CupertinoSwitch(
                          value: value,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    2.sH,
                    ProfileRow(
                      onTap: () {
                        context.push(AppRoutes.setting);
                      },
                      title: 'Setting',
                    ),
                    2.sH,
                    ProfileRow(
                      onTap: () {
                        context.push(AppRoutes.forgotPassword);
                      },
                      title: 'Forgot password',
                    ),
                    2.sH,
                    ProfileRow(
                      onTap: () async {
                        final authController =
                            ref.read(authControllerProvider.notifier);

                        await authController.signOut().then((_) {
                          context.go(AppRoutes.login);
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(error.toString())),
                          );
                        });
                      },
                      text: false,
                      title: 'Logout',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
