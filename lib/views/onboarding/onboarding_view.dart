import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/models/onboarding_item.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("Skip"),
                onPressed: () {
                  context.push(AppRoutes.register);
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 60.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: PageView.builder(
                  controller: controller,
                  itemCount: onboardData.length,
                  onPageChanged: (value) {
                    setState(() {});
                  },
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.asset(
                        onboardData[index].asset,
                        height: 40.h,
                      ),
                      Text(
                        onboardData[index].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        onboardData[index].subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: onboardData.length,
                effect: WormEffect(
                  dotHeight: 4,
                  dotWidth: 30,
                  activeDotColor: AppColors.primaryColor,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: AppButton(
                title: false ? "Get started" : "Next",
                onTap: () {
                  if (controller.page == 4) {
                    context.push(AppRoutes.register);
                  }
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
