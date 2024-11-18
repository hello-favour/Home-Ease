import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:sizer/sizer.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.getstarted.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 35.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.blackColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enjoy Furniture at \nits finest",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    2.sH,
                    AppButton(
                      title: 'Get Started',
                      onTap: () {
                        context.push(AppRoutes.onboarding);
                      },
                    ),
                    2.sH,
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
