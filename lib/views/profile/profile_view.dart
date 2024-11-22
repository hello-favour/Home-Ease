import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/profile/widgets/profile_row.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
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
                  const Spacer(),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: const Icon(Icons.search),
                  // ),
                  Text(
                    "Profile",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Spacer(),
                ],
              ),
            ),
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
                    Text(
                      "Jane Doe",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text("jane@gmail.com",
                        style: Theme.of(context).textTheme.bodyMedium),
                    5.sH,
                    ProfileRow(
                      onTap: () {},
                      title: 'My Orders',
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
                    ProfileRow(
                      onTap: () {
                        context.push(AppRoutes.setting);
                      },
                      title: 'Setting',
                    ),
                    2.sH,
                    ProfileRow(
                      onTap: () {
                        context.push(AppRoutes.login);
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
