import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/auth/controller/auth_controller.dart';
import 'package:home_ease/views/home/controller/user_controller.dart';
import 'package:home_ease/views/profile/widgets/profile_row.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  final bool value = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userControllerProvider);
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: userState.when(
        data: (user) {
          if (user == null) {
            debugPrint("GETTING USER: $user");
            return const Center(child: Text("No user found"));
          }
          return SafeArea(
            child: Column(
              children: [
                2.sH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      "Profile",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const Spacer(),
                  ],
                ),
                2.sH,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      2.sH,
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
                              text: user.name,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      5.sH,
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            color: AppColors.whiteColor,
                            child: Column(
                              children: [
                                2.sH,
                                ProfileRow(
                                  onTap: () {
                                    context.go(AppRoutes.cart);
                                  },
                                  title: 'Orders',
                                ),
                                2.sH,
                                ProfileRow(
                                  onTap: () {
                                    context.go(AppRoutes.favorite);
                                  },
                                  title: 'Wishlist',
                                ),
                                2.sH,
                                ProfileRow(
                                  onTap: () {},
                                  title: 'Payment',
                                ),
                                2.sH,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Dark mode",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
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
                                  title: 'Edit Profile',
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
                                    final authController = ref
                                        .read(authControllerProvider.notifier);

                                    await authController.signOut().then((_) {
                                      context.go(AppRoutes.login);
                                    }).catchError((error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(error.toString())),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text("Error: ${error.toString()}"),
        ),
      ),
    );
  }
}
