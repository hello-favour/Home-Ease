import 'package:home_ease/gen/assets.gen.dart';

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
    title: "Furnish Your Dream Home",
    subTitle:
        "Discover a wide range of stylish furniture and home appliances to make your space truly yours.",
  ),
  OnboardingItem(
    asset: Assets.images.image2.path,
    title: "Convenient Shopping",
    subTitle:
        "Shop with ease and comfort from anywhere. Explore our collections and bring elegance home.",
  ),
  OnboardingItem(
    asset: Assets.images.image3.path,
    title: "Secure & Reliable",
    subTitle:
        "We ensure secure transactions and reliable delivery, so your dream furniture arrives safely.",
  ),
  OnboardingItem(
    asset: Assets.images.image4.path,
    title: "Flexible Payment Options",
    subTitle:
        "Choose payment plans that fit your budget. Upgrade your space without breaking the bank.",
  ),
  OnboardingItem(
    asset: Assets.images.image5.path,
    title: "Exclusive Offers Await",
    subTitle:
        "Get access to special deals and discounts on premium furniture and appliances.",
  ),
];
