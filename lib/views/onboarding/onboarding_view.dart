import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingItem {
  final String asset;
  final String title;
  final String subTitle;
  const OnboardingItem({
    required this.asset,
    required this.title,
    required this.subTitle,
  });
}

final onboardData = [
  OnboardingItem(
    asset: Assets.images.image1.path,
    title: "Easy Savings",
    subTitle:
        "Want to keep your cash close? Akagum’s got your back! Save easily, and watch those coins multiply like rabbits",
  ),
  OnboardingItem(
    asset: Assets.images.image2.path,
    title: "Flexible Withdrawal",
    subTitle:
        "Need to grab some cash? With Akagum, you can withdraw just enough to keep you happy and your wallet chubby!",
  ),
  OnboardingItem(
    asset: Assets.images.image3.path,
    title: "Secure & Reliable",
    subTitle:
        "Akagum: We’re tighter than your grip on that last kobo. Your money’s safe, sound, and sitting pretty.",
  ),
  OnboardingItem(
    asset: Assets.images.image4.path,
    title: "Schedule Your Withdrawals",
    subTitle:
        "Akagum can help you plan ahead and withdraw only when it’s time, stay disciplined and reach your goals.",
  ),
  OnboardingItem(
    asset: Assets.images.image5.path,
    title: "Boost Your Money Management",
    subTitle:
        "Take control of your finances with tools that help you save smarter and manage better.",
  ),
];

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
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        onboardData[index].subTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 14.sp,
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
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ElevatedButton(
                onPressed: () {
                  if (controller.page == 4) {
                    context.push(AppRoutes.register);
                  }
                },
                child: const Text(
                  false ? "Get started" : "Next",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
