import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/models/offer_model.dart';
import 'package:home_ease/providers/carousel_notifier.dart';
import 'package:sizer/sizer.dart';

class CarouselState {
  final int currentIndex;
  CarouselSliderController? carouselController = CarouselSliderController();
  final List<OfferModel> offerList;

  CarouselState({
    required this.currentIndex,
    required this.carouselController,
    required this.offerList,
  });

  CarouselState copyWith({
    int? currentIndex,
    CarouselSliderController? carouselController,
    List<OfferModel>? offerList,
  }) {
    return CarouselState(
      currentIndex: currentIndex ?? this.currentIndex,
      carouselController: carouselController ?? this.carouselController,
      offerList: offerList ?? this.offerList,
    );
  }
}

final carouselProvider =
    StateNotifierProvider<CarouselNotifier, CarouselState>((ref) {
  return CarouselNotifier();
});

class OffersList extends ConsumerWidget {
  const OffersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carouselState = ref.watch(carouselProvider);

    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselState.carouselController,
          itemCount: carouselState.offerList.length,
          itemBuilder: (context, index, realIndex) {
            final data = carouselState.offerList[index];
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 16 : 8,
                right: index == carouselState.offerList.length - 1 ? 16 : 8,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    image: AssetImage(data.image!),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 0.85,
            padEnds: false,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              ref.read(carouselProvider.notifier).updateIndex(index);
            },
          ),
        ),
        Center(
          child: DotsIndicator(
            dotsCount: carouselState.offerList.length,
            position: carouselState.currentIndex,
            decorator: DotsDecorator(
              color: const Color(0xFFA7AEC1),
              activeColor: AppColors.primaryColor,
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // size: Size(5.w, 2.h),
              // activeSize: Size(18.33.w, 2.h),
              spacing: EdgeInsets.only(right: 2.w),
            ),
          ),
        ),
      ],
    );
  }
}
